"""Offline display checks only. Never starts a VM, runner or installer."""
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import zipfile

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
REPO=ROOT.parent
S2=ROOT/'experiments/call_path_followup/attempt01'
BASE='5662e612854d6198c2da1525a234d682547ba6b0'
TITLE='四组调用方式：关键字节码对照'


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def text(p):
    return p.read_text(encoding='utf-8')


def frames(s):
    return re.findall(r'\\begin\{frame\}(?:\[[^\]]*\])?\{[^}]*\}.*?\\end\{frame\}',s,re.S)


def norm(s):
    return ' '.join(s.split())


def instruction(x):
    return f"{x['offset']} {x['opcode']} {x['operands']}".strip()


sources={}
def decoded(case,engine,fn):
    base=S2/'bytecode'/case/engine/fn
    jp=base.with_suffix('.decoded.json');tp=base.with_suffix('.txt')
    data=json.loads(text(jp));raw=text(tp)
    sources[str(jp.relative_to(ROOT))]=sha(jp)
    sources[str(tp.relative_to(ROOT))]=sha(tp)
    if engine=='v8':
        actual=[]
        for line in raw.splitlines():
            m=re.search(r'@\s*(\d+)\s*:\s*((?:[0-9a-f]{2}\s+)+)([A-Za-z][A-Za-z0-9_]*)\s*(.*)',line)
            if m:
                actual.append(dict(offset=int(m[1]),opcode=m[3],operands=m[4].strip(),hex=m[2].split()))
        assert len(actual)==len(data)
        for a,b in zip(actual,data):
            assert all(a[k]==b[k] for k in ('offset','opcode','operands','hex'))
    else:
        code=raw.split('  opcodes:',1)[1]
        actual=[]
        for line in code.splitlines():
            if not line.strip() or line.lstrip().startswith(';;'):continue
            m=re.fullmatch(r'\s*(?:(\d+):\s*)?([a-z][a-z0-9_]*)\s*(.*)',line)
            assert m,repr(line)
            actual.append(m)
        assert len(actual)==len(data)
        for a,b in zip(actual,data):
            assert a[2]==b['opcode'] and a[3].strip()==b['operands']
            if a[1] is not None:assert int(a[1])==b['offset']
    assert data[0]['offset']==0
    assert all(a['offset']+a['size']==b['offset'] for a,b in zip(data,data[1:]))
    return data


def main():
    base_bytes=subprocess.run(['git','-c','safe.directory='+REPO.as_posix(),'show',
        BASE+':js-interpreter-bench/reports/weekly_20261017/main_fixed.tex'],cwd=REPO,
        capture_output=True,check=True).stdout
    original=base_bytes.decode().replace('\r\n','\n')
    current=text(HERE/'main_fixed.tex')
    frame=text(HERE/'call_bytecode_frame.tex').strip()
    old=frames(original);new=frames(current)
    assert len(old)==8 and len(new)==9
    assert len(frames(current[:current.index(r'\appendix')]))==7
    assert new[2]==frame and TITLE in new[2]
    assert '四组调用方式' in new[1] and '67.132' in new[1]
    assert new[:2]+new[3:]==old,'one or more existing frames changed'
    assert current.replace(frame+'\n\n','',1)==original,'change must be exactly the inserted frame'
    assert r'\documentclass[UTF8,aspectratio=169,10pt,fontset=fandol]{ctexbeamer}' in current
    assert r'\setmonofont{Latin Modern Mono}' in current
    assert not re.search(r'\\(?:input|include|includegraphics)\b',current)
    font_match=re.search(r'\blstset\{basicstyle=\\ttfamily\\fontsize\{([0-9.]+)\}\{([0-9.]+)\}',frame)
    assert font_match and r'breaklines=false' in frame
    fontsize=float(font_match[1]);code_leading=float(font_match[2])
    assert fontsize>=9 and code_leading>=fontsize
    fractions=list(map(float,re.findall(r'\\begin\{column\}\{([0-9.]+)\\textwidth\}',frame)))
    assert len(fractions)==15 and all(fractions[i:i+3]==fractions[:3] for i in range(0,15,3))
    assert sum(fractions[:3])<1
    assert not any(t in frame for t in ('**','\u00a0',r'\<',r'\resizebox',r'\scalebox','shrink','minted'))
    blocks=re.findall(r'\\begin\{lstlisting\}\n(.*?)\\end\{lstlisting\}',frame,re.S)
    assert len(blocks)==8
    matrix=[('inline','cfInline',{'quickjs':[12,17,18],'v8':[11,15,18]}),
        ('direct_call','cfDirectLoop',{'quickjs':[10,13,14,15],'v8':[11,14,15]}),
        ('own_method','cfMethodLoop',{'quickjs':[11,16,17],'v8':[11,15,16]}),
        ('prototype_method','cfMethodLoop',{'quickjs':[11,16,17],'v8':[11,15,16]})]
    callers=[];matched=[];widths=[]
    # Width numbers are explicitly estimates, not TeX font metrics or a render.
    textwidth_pt=144/25.4*72.27
    for case,fn,offsets in matrix:
        for engine in ('quickjs','v8'):
            data=decoded(case,engine,fn);callers.append((case,engine,fn,data))
            selected=[x for x in data if x['offset'] in offsets[engine]]
            indices=[data.index(x) for x in selected]
            assert indices==list(range(indices[0],indices[0]+len(indices))), 'not contiguous'
            block=blocks[len(matched)].strip().splitlines()
            assert [norm(l) for l in block]==[instruction(x) for x in selected]
            assert not any(not l.strip() for l in block)
            matched.append(dict(case=case,engine=engine,function=fn,offsets=offsets[engine],contiguous=True))
            max_chars=max(map(len,block));available=textwidth_pt*fractions[1 if engine=='quickjs' else 2]
            estimate=max_chars*fontsize*.525
            widths.append(dict(case=case,engine=engine,max_chars=max_chars,fontsize_pt=fontsize,
                estimated_width_pt=estimate,available_width_pt=available,estimate_only=True))
            assert estimate<available, 'estimated code width exceeds column; not a real font check'
    notes=text(HERE/'call_bytecode_notes.md')
    note_blocks=re.findall(r'```text\n(.*?)\n```',notes,re.S)
    assert len(note_blocks)==12
    callees=[('direct_call','quickjs','stepPlain'),('own_method','quickjs','stepMethod'),
             ('direct_call','v8','stepPlain'),('own_method','v8','stepMethod')]
    for block,(case,engine,fn) in zip(note_blocks[:4],callees):
        data=decoded(case,engine,fn)
        assert [norm(l) for l in block.splitlines()]==[instruction(x) for x in data]
        if fn=='stepMethod':assert data==decoded('prototype_method',engine,fn)
    for block,(case,engine,fn,data) in zip(note_blocks[4:],callers):
        assert [norm(l) for l in block.splitlines()]==[instruction(x) for x in data]
    for engine in ('quickjs','v8'):
        own=next(d for c,e,f,d in callers if c=='own_method' and e==engine)
        proto=next(d for c,e,f,d in callers if c=='prototype_method' and e==engine)
        canonical=lambda d:[(x['offset'],x['opcode'],re.sub(r'0x[0-9a-f]+','<address>',x['operands'])) for x in d]
        assert canonical(own)==canonical(proto)
    for case in ('own_method','prototype_method'):
        p=S2/'raw/diagnostics'/f'{case}_paths.json';rec=json.loads(text(p))
        assert rec['exit_code']==0 and not rec['stderr']
        paths=json.loads(re.search(r'^PATHS (.+)$',rec['stdout'],re.M)[1])
        step=next(x for x in paths['categories'] if x['atom']=='step')
        assert step['get_field2']==4096
        if case=='own_method':assert step['own_hit']==4096 and step['prototype_hit']==0
        else:assert step['own_hit']==0 and step['prototype_hit']==step['hops'][1]==4096
        sources[str(p.relative_to(ROOT))]=sha(p)
    for p in [S2/'case_notes.md',S2/'manifest.json',S2/'summary.csv',S2/'source_evidence/method_bytecode_equal.json',
              S2/'source_evidence/shared_method_core.json']:
        sources[str(p.relative_to(ROOT))]=sha(p)
    # Static brace/environment checks, treating listings as literal code.
    clean=re.sub(r'\\begin\{lstlisting\}.*?\\end\{lstlisting\}','',current,flags=re.S)
    clean=re.sub(r'(?m)(?<!\\)%.*$','',clean)
    stack=[]
    for m in re.finditer(r'\\(begin|end)\{([^}]+)\}',clean):
        if m[1]=='begin':stack.append(m[2])
        else:assert stack and stack.pop()==m[2]
    assert not stack
    depth=0
    for m in re.finditer(r'(?<!\\)[{}]',clean):
        depth+=1 if m[0]=='{' else -1
        assert depth>=0
    assert depth==0
    for f in new:
        if r'\begin{lstlisting}' in f:assert 'fragile' in f.split('\n',1)[0]
    assert r'\input{call_bytecode_frame.tex}' in text(HERE/'call_bytecode_minimal.tex')
    members=['main_fixed.tex','notes.md','README_Overleaf.md','call_bytecode_frame.tex',
             'call_bytecode_notes.md','call_bytecode_minimal.tex']
    archive=HERE/'weekly_20261017_call_bytecode_overleaf.zip'
    # New package only; never overwrite the two historical packages.
    with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
        for name in members:z.write(HERE/name,name)
    with zipfile.ZipFile(archive) as z:
        assert z.testzip() is None and z.namelist()==members
        assert all(z.read(n)==(HERE/n).read_bytes() for n in members)
    for rel,digest in sources.items():assert sha(ROOT/rel)==digest
    report=dict(status='OFFLINE_CHECKS_PASS_NOT_COMPILED',date='2026-10-19',data_cutoff='2026-10-17',
        baseline_commit=BASE,baseline_main_git_blob_sha256=hashlib.sha256(base_bytes).hexdigest(),
        source_frames_before=8,source_frames_after=9,main_frames=7,appendix_frames=2,inserted_page=3,
        existing_eight_frames_unchanged=True,previous_performance_table_unchanged=True,
        standalone_frame_matches_embedded=True,caller_snippets=matched,complete_caller_notes_checked=8,
        complete_callee_notes_checked=4,prototype_callee_copies_also_checked=True,
        raw_txt_and_decoded_sources_checked=14,QJS_existing_step_path_counts_checked=True,
        source_hashes=sources,code_width_estimates_only=widths,
        layout=dict(column_fractions=fractions[:3],fontsize_pt=fontsize,code_leading_pt=code_leading,
            estimated_intercolumn_gap_pt=textwidth_pt*(1-sum(fractions[:3]))/2,
            cell_vertical_spacing_pt=3,group_separator_pt=.2,rendering_not_verified=True),
        compilation=dict(status='NOT_RUN_MISSING_COMPILER',xelatex_in_Windows_PATH=shutil.which('xelatex'),
            latexmk_in_Windows_PATH=shutil.which('latexmk'),actual_pdf_page_count=None,
            WSL_manual_check=dict(command="wsl.exe -d Ubuntu -- sh -c 'command -v xelatex; command -v latexmk; command -v tectonic; command -v kpsewhich; true'",
                result='exit 0; no tool path returned; WSL localhost proxy warning, not a TeX error'),
            overfull_check='NOT_RUN',visual_check='NOT_RUN',missing_glyph_check='NOT_RUN'),
        new_archive=archive.name,package_members=members,package_sha256=sha(archive),
        main_sha256=sha(HERE/'main_fixed.tex'),frame_sha256=sha(HERE/'call_bytecode_frame.tex'),
        no_experiment_executed=True,no_VM_source_changed=True)
    (HERE/'validation_call_bytecode.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(report['status'])
    print('8 -> 9 source frames; original 8 untouched; 8 snippets + 8 callers + 4 callees matched real dumps.')
    print('XeLaTeX/visual/actual page count/Overfull checks NOT RUN. No PDF generated.')
    print(archive)


if __name__=='__main__':main()
