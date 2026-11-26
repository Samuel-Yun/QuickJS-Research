"""Create a new UNUSED cohort folder only; never executes/retries an engine."""
import argparse
from common import *
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--attempt',required=True);args=p.parse_args()
    assert re.fullmatch(r'attempt\d{2,}',args.attempt)
    dest=HERE.parent/args.attempt;assert not dest.exists(),'choose next UNUSED attempt'
    names=['common.py','prepare.py','run.py','host_record.py','crypto_inputs.py','analyze.py','test_analysis.py','analysis_ready.py','independent_audit.py','extension_review.json','.gitattributes','.gitignore']
    for name in names:save(dest/name,(HERE/name).read_bytes())
    save(dest/'README.md','Fresh independent cohort, no old raw copied. Run test_analysis.py and analysis_ready.py, record host_record.py on Windows, then run.py inside the same Ubuntu. No engine is started by new_campaign.py. Never append new boot records to attempt01.\n')
    print('CREATED_ONLY',dest,'no runtimes started, no raw copied')
