"""Raw-only statistics reused unchanged; no Linux, binary or private dependency."""
import importlib.util
from pathlib import Path
HERE=Path(__file__).resolve().parent
source=HERE.parent/'attempt01/analyze.py'
spec=importlib.util.spec_from_file_location('paired_raw_analysis',source)
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
module.HERE=HERE
if __name__=='__main__':module.main()
