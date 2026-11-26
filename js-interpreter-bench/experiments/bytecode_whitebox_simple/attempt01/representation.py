"""Verify diagnostic and release compiler serialization, without timing either."""
import re
from pathlib import Path
from run import HERE, ROOT, capture, config, manifest, read, save, sha, verify


def main():
    verify()
    formal_dir=Path(manifest()["engines"]["quickjs"]["binary"]["path"]).parent
    diag_dir=Path(read(HERE/"source_evidence/counter_build_persistent.json")["binary"]).parent
    rows=[]
    (HERE/"bytecode/serialization").mkdir(parents=True,exist_ok=True)
    for case in config():
        blobs={}
        for label,directory in (("release",formal_dir),("diagnostic",diag_dir)):
            out=HERE/"bytecode/serialization"/(case+"."+label+".c")
            record=HERE/"raw/diagnostics"/("serialize_"+case+"_"+label+"_attempt02.json")
            if not record.exists():
                assert not out.exists(), "Preserve partial serialization output in a new attempt"
            r=capture(record,[str(directory/"qjsc"),"-c","-N","wb_serialized","-o",str(out),str(HERE/"cases"/(case+".js"))])
            assert r["exit_code"]==0,r
            text=out.read_text()
            match=re.search(r"const uint8_t wb_serialized\[\d+\] = \{(.*?)\};",text,re.S)
            assert match
            blobs[label]=bytes(int(x,16) for x in re.findall(r"0x([0-9a-fA-F]{2})",match[1]))
        assert blobs["release"]==blobs["diagnostic"],case
        rows.append(dict(case=case,serialized_bytes_equal=True,length_bytes=len(blobs["release"]),
                         release_C_sha256=sha(HERE/"bytecode/serialization"/(case+".release.c")),
                         diagnostic_C_sha256=sha(HERE/"bytecode/serialization"/(case+".diagnostic.c"))))
    original=ROOT/"engines/quickjs-upstream"
    reused=Path(manifest()["diagnostic_quickjs"]["path"]).parent
    identity={name:dict(formal_vs_diagnostic_equal_ignoring_line_endings=(original/name).read_text()==(reused/name).read_text())
              for name in ("quickjs-opcode.h","quickjs.h","quickjs-libc.c","Makefile")}
    save(HERE/"source_evidence/quickjs_text_identity.json",identity)
    save(HERE/"source_evidence/serialization_comparison.json",dict(cases=rows,
         release_qjsc=dict(path=str(formal_dir/"qjsc"),sha256=sha(formal_dir/"qjsc")),
         diagnostic_qjsc=dict(path=str(diag_dir/"qjsc"),sha256=sha(diag_dir/"qjsc")),
         boundary="Same revision/compiler representation corroboration; not a live memory dump of the frozen qjs process"))
    print("SERIALIZATION_EQUAL",len(rows),flush=True)


if __name__=="__main__": main()
