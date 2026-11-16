"""Public raw-only whole-child auxiliary distributions, not initialization time."""
from analyze import HERE,load,summary,csvout,save
def main():
    for kind in ['mechanism','sunspider','micro','octane']:
        root=HERE/kind;protocol=load(root/'protocol.json');rows=[load(p) for p in (root/'raw/formal').rglob('*.json')];out=[]
        for case in protocol['cases']:
            for c in protocol['conditions']:
                rr=[r for r in rows if r['case']==case and r['condition']==c and r['valid']]
                for metric in ['external_wall_ms','child_user_ms','child_system_ms']:
                    out.append(dict(case=case,condition=c,metric=metric,unit='ms/whole fresh process',**summary([r[metric] for r in rr])))
        csvout(root/'analysis/whole_child_auxiliary.csv',out)
    save(HERE/'auxiliary_notes.md','# 辅助时间口径\n\nexternal_wall_ms、child_user_ms、child_system_ms均为整个新进程（包含加载/退出）的分布，不是内部区间CPU。内部elapsed只围住N次Run；两种中位数不可相减后叫精确初始化时间。whole_child_auxiliary.csv未用来筛选或删除正式样本。\n')
    print('AUXILIARY_RAW_ONLY_DONE',flush=True)
if __name__=='__main__':main()
