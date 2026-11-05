"""Read original raw, or its byte-identical public gzip archive. No engine access."""
import gzip,hashlib,json,os
from pathlib import Path
H=Path(__file__).resolve().parent
def raw_bytes():
    original=H/'runs.jsonl'
    use_original=original.exists() and os.environ.get('IC_SEARCH_V2_ARCHIVE_ONLY')!='1'
    data=original.read_bytes() if use_original else gzip.decompress((H/'runs.jsonl.gz').read_bytes())
    if (H/'raw_archive.json').exists():
        meta=json.loads((H/'raw_archive.json').read_text(encoding='utf-8'))
        assert hashlib.sha256(data).hexdigest()==meta['uncompressed_SHA256']
        compressed=(H/'runs.jsonl.gz').read_bytes()
        assert hashlib.sha256(compressed).hexdigest()==meta['compressed_SHA256']
    return data
def rows():return [json.loads(s) for s in raw_bytes().decode('utf-8').splitlines()]
