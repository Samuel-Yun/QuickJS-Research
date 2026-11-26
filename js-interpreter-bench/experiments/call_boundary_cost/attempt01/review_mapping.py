"""Conservative CFG review of exact instructions; mixed blocks stay SHARED.
Source labels are only candidates. This emits an auditable per-block review index.
"""
from common import *
def main():
    records=list(csv.DictReader((HERE/'mapping/candidates.csv').open()));symbols=list(csv.DictReader((HERE/'mapping/symbols.csv').open()));sym=next(s for s in symbols if s['symbol']=='JS_CallInternal');lo,hi=int(sym['start']),int(sym['end']);pcs=[int(r['start'],16) for r in records];lookup={pc:i for i,pc in enumerate(pcs)}
    boundaries={lo};edges=[]
    for i,r in enumerate(records):
        text=r['instruction'];mn=text.split()[0] if text else '';match=re.match(r'j\w*\s+([0-9a-f]+)\s+<',text)
        if match:
            target=int(match[1],16)
            if target in lookup:boundaries.add(target);edges.append((int(r['start'],16),target))
        if mn.startswith('j') or mn.startswith('ret') or mn.startswith('call'):
            if i+1<len(pcs):boundaries.add(pcs[i+1])
    starts=sorted(boundaries);block_for={};blocks=[]
    allowed_value={'OP_add','OP_sub','OP_mul','OP_lt','OP_lte','OP_gt','OP_gte','OP_strict_eq','OP_strict_neq','OP_eq','OP_neq','OP_inc','OP_dec','OP_post_inc','OP_post_dec','OP_nop','OP_drop','OP_dup','OP_swap','OP_return'}
    for bi,start in enumerate(starts):
        end=starts[bi+1] if bi+1<len(starts) else hi;rs=[r for r in records if start<=int(r['start'],16)<end];cats=set()
        for r in rs:
            cat=r['category'];op=r['source_opcode']
            if cat=='LOOP_VALUE' and not (op in allowed_value or any(op.startswith('OP_'+x) for x in ['get_loc','put_loc','set_loc','get_arg','put_arg','push_','inc_loc','add_loc','goto','if_'])):cat='SHIM_UNKNOWN'
            cats.add(cat)
        category=next(iter(cats)) if len(cats)==1 else 'SHIM_UNKNOWN'
        # Mixed source-origin blocks are not split solely by a line number.
        blocks.append(dict(block_start=hex(start),block_end=hex(end),category=category,candidate_categories=','.join(sorted(cats)),instruction_count=len(rs),source_lines=','.join(sorted({r['source_line'] for r in rs if r['source_line']})),source_opcodes=','.join(sorted({r['source_opcode'] for r in rs if r['source_opcode']})),basis='exact disassembly basic block + complete DWARF inline origin + source opcode semantics; mixed/unresolved retained SHARED'))
        for r in rs:block_for[int(r['start'],16)]=len(blocks)-1
    # A block receiving unlike semantic origins may be compiler-shared cleanup.
    incoming={i:set() for i in range(len(blocks))}
    for src,dst in edges:
        if src in block_for and dst in block_for:incoming[block_for[dst]].add(blocks[block_for[src]]['category'])
    for i,b in enumerate(blocks):
        b['incoming_categories']=','.join(sorted(incoming[i]))
        if b['category'] in ['CALLER_CALL','PROPERTY','LOOP_VALUE'] and len(incoming[i]-{'SHIM_UNKNOWN'})>1:
            b['category']='SHIM_UNKNOWN';b['basis']='multiple unlike incoming semantic regions: compiler-shared block retained UNKNOWN'
    result=[]
    for i,r in enumerate(records):
        b=blocks[block_for[int(r['start'],16)]];result.append(dict(start=r['start'],end=records[i+1]['start'] if i+1<len(records) else hex(hi),category=b['category'],basis=b['basis'],block_start=b['block_start'],instruction=r['instruction'],source_line=r['source_line'],source_opcode=r['source_opcode'],inline_chain=r['inline_chain']))
    assert result[0]['start']==hex(lo) and int(result[-1]['end'],16)==hi
    csvout(HERE/'mapping/block_review.csv',blocks);csvout(HERE/'address_categories.csv',result)
    save(HERE/'mapping/review_status.json',dict(status='CONSERVATIVE_CFG_PARTITION',instructions=len(result),blocks=len(blocks),manual_hot_block_review='PENDING',shared_or_unknown_blocks=sum(b['category']=='SHIM_UNKNOWN' for b in blocks),categories_are_coarse=True,callee_exit_includes_shared_normal_or_exception_exit=True,hardware_cycles=False))
    print('REVIEW_BLOCKS',len(blocks),flush=True)
if __name__=='__main__':main()
