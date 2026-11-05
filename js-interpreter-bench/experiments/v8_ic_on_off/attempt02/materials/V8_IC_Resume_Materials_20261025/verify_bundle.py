from pathlib import Path
import hashlib
import json

root = Path(__file__).resolve().parent
manifest = json.loads((root / "source_manifest.json").read_text())
for item in manifest["files"]:
    p = root / item["bundle_path"]
    data = p.read_bytes()
    assert len(data) == item["size_bytes"], str(p)
    assert hashlib.sha256(data).hexdigest() == item["sha256"], str(p)
print("SOURCE_BUNDLE_SHA256_PASS", len(manifest["files"]))

