"""Interleave pristine SPARSE and three modes of one candidate ELF, one CPU."""
import argparse, csv, json, os, subprocess
from pathlib import Path

def main():
    ap=argparse.ArgumentParser()
    for key in ['sparse','candidate','scripts','out']:
        ap.add_argument('--'+key, required=True, type=Path)
    ap.add_argument('--rounds',type=int,default=5)
    ap.add_argument('--cpu',type=int,default=None)
    opt=ap.parse_args()
    cpu=min(os.sched_getaffinity(0)) if opt.cpu is None else opt.cpu
    os.sched_setaffinity(0,{cpu})
    names=['sparse','off','direct','cached']
    cases=['EarleyBoyer.Boyer','EarleyBoyer.Earley','PdfJS.PdfJS']
    order=[[0,1,3,2],[1,2,0,3],[2,3,1,0],[3,0,2,1]]
    with opt.out.open('w') as f:
        writer=csv.writer(f);writer.writerow(['case','round','order','mode','N','ms_per_Run','cpu'])
        for i in range(opt.rounds):
            for k in range(len(cases)):
                j=(i+k)%len(cases); case=cases[j]
                script,=opt.scripts.glob('octane.'+case+'.N*.measure.js')
                for pos,idx in enumerate(order[(i+j)%4],1):
                    mode=names[idx];exe=opt.sparse if mode=='sparse' else opt.candidate
                    env=dict(os.environ,QJS_INSTANCE_MODE=mode)
                    p=subprocess.run([str(exe.resolve()),'--script',str(script)],env=env,capture_output=True,text=True,check=True)
                    report=json.loads(p.stdout.split('OCTANE_IC_RESULT:')[-1])
                    assert report['case']==case and report['correctness']=='PASS'
                    writer.writerow([case,i+1,pos,mode,report['N'],report['elapsed_per_Run_ms'],cpu])
                    f.flush()
            print('finished round',i+1,flush=True)
if __name__=='__main__':main()
