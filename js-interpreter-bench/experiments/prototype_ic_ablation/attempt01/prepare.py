"""Actual bounded remaining preparation, stops on failure; no performance."""
import build,test,diagnose,extra
if __name__=='__main__':
    build.diagnostic()
    test.lifecycle()
    test.workloads()
    diagnose.run()
    extra.serialization()
    extra.sanitizer()
    extra.assembly()
    print('PREPARATION_COMPLETE',flush=True)
