"""Bounded diagnostic evidence; never a source of performance measurements."""
import base64
import difflib
import os
import subprocess
import urllib.request
from pathlib import Path
from run import HERE, ROOT, DIAG, capture, command, config, manifest, read, save, sha, verify


def main():
    verify()

    from native_handlers import main as native_evidence
    native_evidence()
    evidence = HERE / "source_evidence"
    original = ROOT / "engines/quickjs-upstream"
    diagdir = Path(DIAG).parent
    files = {}
    for name in ("quickjs.c", "quickjs-opcode.h", "quickjs.h", "qjs.c", "quickjs-libc.c", "Makefile"):
        formal = Path(manifest()["engines"]["quickjs"]["binary"]["path"]).parent / name
        files[name] = dict(repository_sha256=sha(original/name), frozen_source_sha256=sha(formal),
                           reused_diagnostic_sha256=sha(diagdir/name))
        assert sha(original/name) == sha(formal)
    patch = "".join(difflib.unified_diff((original/"quickjs.c").read_text().splitlines(True),
                                      (diagdir/"quickjs.c").read_text().splitlines(True),
                                      fromfile="upstream/quickjs.c", tofile="reused-diagnostic/quickjs.c"))
    save(evidence/"reused_quickjs.patch", patch)
    save(evidence/"quickjs_source_identity.json", files)
    save(evidence/"quickjs_text_identity.json", {name:dict(
        formal_vs_diagnostic_equal_ignoring_line_endings=(original/name).read_text()==(diagdir/name).read_text())
        for name in ("quickjs-opcode.h","quickjs.h","quickjs-libc.c","Makefile")})
    for name, lo, hi, filename in (
        ("quickjs.c", 17746, 17900, "qjs_dispatch_frame.txt"),
        ("quickjs.c", 18583, 18608, "qjs_local_arg_moves.txt"),
        ("quickjs.c", 18822, 18924, "qjs_jumps.txt"),
        ("quickjs.c", 19696, 19801, "qjs_add.txt"),
        ("quickjs.c", 20047, 20080, "qjs_increment.txt"),
        ("quickjs.c", 20227, 20298, "qjs_compare.txt"),
        ("quickjs.c", 6135, 6160, "qjs_shape_lookup.txt"),
        ("quickjs.c", 19107, 19179, "qjs_get_field.txt"),
        ("quickjs.c", 18173, 18242, "qjs_calls.txt"),
        ("quickjs.h", 687, 716, "qjs_refcounts.txt"),
        ("quickjs.c", 36260, 36274, "qjs_final_dump_stage.txt"),
        ("quickjs-libc.c", 2118, 2147, "qjs_monotonic_clock.txt")):
        lines = (original/name).read_text().splitlines()
        save(evidence/filename, f"{name}; revision 04be246001599f5995fa2f2d8c91a0f198d3f34c\n"+
             "\n".join(f"{i+1}: {lines[i]}" for i in range(lo-1, hi))+"\n")

    # Check both arithmetic arms and every branch input independently, outside formal processes.
    source = "\n".join((HERE/"cases"/(c+".js")).read_text() for c in config())
    extra = """
;(function(){
 var answers=[wbArithmetic(7,3,4),wbArithmetic(7,-3,4),wbBranches([-3]),wbBranches([4]),wbBranches([-1]),wbBranches([8])];
 if(JSON.stringify(answers)!=='[15,5,3,8,1,16]') throw Error('arm check failed');
 if(!Object.prototype.hasOwnProperty.call(wbOwnObject,'value')) throw Error('not own');
 if(Object.prototype.hasOwnProperty.call(wbPrototypeObject,'step')) throw Error('method is own');
 if(Object.getPrototypeOf(wbPrototypeObject)!==Object.getPrototypeOf(wbPrototypeSibling)) throw Error('prototype differs');
 if(wbPrototypeObject.step!==wbPrototypeSibling.step) throw Error('method differs');
 if(wbPrototypeMethod(wbPrototypeSibling,4096)!==8407040) throw Error('receiver semantics');
 console.log('SEMANTICS '+JSON.stringify({arm_results:answers,full_branch_result:wbBranches(wbBranchInput),positive_inputs:2,negative_inputs:2,shared_method:true}));
})();
"""
    p = HERE/"probes/semantics_attempt02.js"
    save(p, source+extra)
    for e in ("quickjs","v8"):
        r=capture(HERE/"raw/diagnostics"/(e+"_semantics_attempt02.json"),command(e,p))
        assert r["exit_code"]==0 and "SEMANTICS " in r["stdout"], r
    # Actual artifact handler code, if the advertised developer flag is functional.
    for name in ("GetNamedProperty","CallProperty1","Add","Inc","JumpLoop"):
        r=capture(HERE/"raw/diagnostics"/("v8_handler_"+name+".json"),
                  manifest()["engines"]["v8"]["command_prefix"]+
                  ["--print-builtin-code","--print-builtin-code-filter="+name,"-e","print('HANDLER_DUMP_DONE')"],timeout=30)
        save(HERE/"bytecode/v8_native"/(name+".txt"),r["stdout"])
        print("V8_HANDLER",name,len(r["stdout"]),r["exit_code"],flush=True)
    # Single-file official tagged reference only: never claim artifact build provenance.
    url="https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21/src/interpreter/interpreter-generator.cc?format=TEXT"
    rp=HERE/"raw/diagnostics/v8_source_fetch.json"
    if not rp.exists():
        try:
            with urllib.request.urlopen(url,timeout=12) as response:
                content=base64.b64decode(response.read())
            assert b"IGNITION_HANDLER" in content
            save(evidence/"v8_interpreter_generator_tag_15.6.21.cc",content)
            record=dict(url=url,status="TAG_REFERENCE_ONLY",sha256=sha(evidence/"v8_interpreter_generator_tag_15.6.21.cc"),exact_artifact_commit=None)
        except Exception as exc:
            record=dict(url=url,status="UNAVAILABLE",error=repr(exc),exact_artifact_commit=None)
        save(rp,record)
    # Reuse the reviewed diagnostic hook patch; replace only its diagnostic header.
    build=Path("/home/mzyx/bytecode_whitebox_simple_attempt01_diag")
    commandline=["sh","-c","if [ ! -d /home/mzyx/bytecode_whitebox_simple_attempt01_diag ]; then cp -a /home/mzyx/richards_method_diag_04be246_attempt01 /home/mzyx/bytecode_whitebox_simple_attempt01_diag; fi; cp "+str(HERE/"probes/ml_counters.h")+" /home/mzyx/bytecode_whitebox_simple_attempt01_diag/ml_counters.h; cd /home/mzyx/bytecode_whitebox_simple_attempt01_diag && make -j2 qjs"]
    br=capture(HERE/"raw/diagnostics/diagnostic_build_persistent.json",commandline,timeout=180)
    assert br["exit_code"]==0,br
    binary=build/"qjs"
    save(evidence/"counter_build_persistent.json",dict(binary=str(binary),sha256=sha(binary),formal=False,optimization="upstream -O2",header_sha256=sha(HERE/"probes/ml_counters.h"),compiler_revision="04be246001599f5995fa2f2d8c91a0f198d3f34c",source_patch="reused_quickjs.patch",source_qjs_sha256=sha(build/"qjs.c")))
    for case,receiver,fn in (("own_property","wbOwnObject","wbOwnProperty"),("prototype_method","wbPrototypeObject","wbStep")):
        p=HERE/"probes"/(case+"_paths.js")
        c=config()[case]
        text=(HERE/"cases"/(case+".js")).read_text()
        text += f"\n__mlDiagBegin({receiver},{fn},{{}},{{}},{{}},{{}},Function.prototype.call);\nvar __wbAnswer={c['call']};\nvar __wbPaths=__mlDiagEnd();\nif(__wbAnswer!=={c['expected']}) throw Error('wrong result');\nconsole.log('PATHS '+__wbPaths);\n"
        save(p,text)
        cmd=command("quickjs",p);cmd[0]=str(binary)
        r=capture(HERE/"raw/diagnostics"/(case+"_paths_persistent.json"),cmd)
        assert r["exit_code"]==0 and "PATHS " in r["stdout"],r
        print(case,r["stdout"],flush=True)
    verify()


if __name__=="__main__":
    main()
