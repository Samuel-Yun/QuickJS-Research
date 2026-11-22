"""Extra replacement-policy Release examples; one fresh process per input/version."""
import os

from run import HERE,b,capture,save


def main():
    os.environ.update(TZ='Asia/Shanghai',LANG='C',LC_ALL='C');os.sched_setaffinity(0,{2})
    out=HERE/'keep_micro_times';out.mkdir(exist_ok=False);b.H=out
    rows=[]
    for pattern in ['alternate','rotate3','c_then_e','ccdd_c_e']:
        for label in ['P2','P2_KEEP_PRIMARY']:
            rows.append(capture(label,'release',case='micro',pattern=pattern,phase='keep_extra'))
    save(out/'results.json',rows)


if __name__=='__main__':main()
