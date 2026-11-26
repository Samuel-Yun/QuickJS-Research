"""Syntax and completion check, with no engine executions."""
import ast
from pathlib import Path
import finalize

files=list(Path(__file__).resolve().parent.glob('*.py'))
for path in files:
    ast.parse(path.read_text(),filename=str(path))
print('PYTHON_SYNTAX_PASS',len(files),flush=True)
finalize.main()
