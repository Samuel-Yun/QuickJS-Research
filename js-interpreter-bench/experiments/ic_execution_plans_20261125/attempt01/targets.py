from run import *
if __name__=='__main__':
 for gate in ['01_forward_numeric/validation01/gate.json','02_compare_branch/validation01/gate.json','03_ctor_coalloc/validation03/gate.json']:assert json.loads((HERE/gate).read_text())['status']=='PASS'
 targeted(['SPARSE','OLD_FORWARD','NUMERIC_PLAN','NUMERIC_OFF'],[('octane','RayTrace')],next_out(HERE/'01_forward_numeric','target'))
 targeted(['SPARSE','COMPARE_FIRST','COMPARE_FULL'],[('octane','Splay')],next_out(HERE/'02_compare_branch','target'))
 targeted(['SPARSE','COALLOC','COALLOC_OFF'],[('octane','EarleyBoyer.Boyer'),('octane','Splay'),('sunspider','access-binary-trees'),('octane','CodeLoad.Closure')],next_out(HERE/'03_ctor_coalloc','target'))
