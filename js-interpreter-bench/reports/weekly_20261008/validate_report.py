"""Static report/data/ZIP validation, not a TeX compiler or visual review."""
import hashlib
import json
import math
import re
import zipfile
from pathlib import Path

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[1]
CHECKS = []


def check(name, okay, detail=None):
    CHECKS.append({"check":name,"status":"PASS" if okay else "FAIL","detail":detail})


def main():
    data_path = OUT/"data_audit.json"
    d = json.loads(data_path.read_text(encoding="utf-8"))
    tex = (OUT/"main.tex").read_text(encoding="utf-8")
    check("offline data audit", d["status"] == "PASS")
    frames = re.findall(r"\\begin\{frame\}(?:\[([^\]]*)\])?\{([^\n]*)\}",tex)
    check("15 source frames",len(frames)==15,{"count":len(frames),"titles":[title for _,title in frames]})
    check("11 main +4 appendix frames",tex.index("\\appendix") > tex.index("下一步——验证") and
          len(re.findall(r"\\begin\{frame\}",tex.split("\\appendix")[0]))==11)
    check("explicit ReportDate",r"\newcommand{\ReportDate}{2026-10-08}" in tex)
    check("ctexbeamer Fandol 16:9", "aspectratio=169,10pt,UTF8,fontset=fandol" in tex)
    check("no input/figure/external compilation dependencies",not re.search(r"\\(?:input|include|includegraphics|bibliography|addbibresource|write18)\b",tex))
    check("no overlays/wholeframe shrinking/minted/OS font",not re.search(r"\\(?:pause|only|uncover|resizebox|scalebox|setCJKsansfont|setsansfont)\b|minted|\[shrink",tex))
    check("verbatim frames fragile",all("fragile" in opts for opts,title in frames if title.startswith("A/B") or "A3" in title))
    # Strip comments/listings before checking ordinary TeX environment and brace nesting.
    plain = re.sub(r"\\begin\{lstlisting\}.*?\\end\{lstlisting\}","",tex,flags=re.S)
    plain = re.sub(r"(?<!\\)%[^\n]*", "", plain)
    stack=[]; env_errors=[]
    for m in re.finditer(r"\\(begin|end)\{([^}]+)\}",plain):
        action,name=m.groups()
        if action=="begin":stack.append(name)
        elif not stack or stack.pop()!=name:env_errors.append(name)
    check("environment nesting",not stack and not env_errors,{"unclosed":stack,"mismatched":env_errors})
    depth=0; negative=False
    for m in re.finditer(r"(?<!\\)[{}]",plain):
        depth+=1 if m[0]=="{" else -1
        negative|=depth<0
    check("ordinary brace balance",depth==0 and not negative)
    # Source notes must not accidentally enter math mode on an identifier underscore.
    source_lines = re.findall(r"\\(?:CompactSources|Sources)\{([^\n]*)\}",tex)
    check("source notes have escaped underscores",not any(re.search(r"(?<!\\)_",line) for line in source_lines))
    check("no Unicode replacement characters", "\ufffd" not in tex)
    check("explicit labeled QJS reference line",r"\draw[black,densely dashed,line width=.9pt] (axis cs:1,.5) -- (axis cs:1,3.6);" in tex and
          "at (axis cs:1,3.6) {QJS=1};" in tex)
    check("Richards definition and wrapped prototype", "Richards 是模拟任务调度的 JavaScript 基准。" in tex and
          r"\Code{TaskControlBlock}\\\Code{.prototype}" in tex)
    check("three-engine vs cache order scope", "三引擎对照：每组 30 新进程" in tex and "每 case A 先 / B 先各 15 轮" in tex)
    check("subset causal limitation retained", "子集变化不能换算成因果占比。" in tex)
    coords=[(float(x),float(y)) for x,y in re.findall(r"\(([-+.\d]+),([-+.\d]+)\)",tex)]
    def plotted(value,y,label):
        check("plotted "+label,any(math.isclose(x,value,rel_tol=0,abs_tol=5.1e-11) and math.isclose(yy,y,abs_tol=1e-8)
                                  for x,yy in coords),{"actual_raw":value,"y":y})
    for case,y in (("RegExp.RegExp",1),("NavierStokes.NavierStokes",2),("Richards.Richards",3)):
        plotted(d["octane"]["pairwise"][case]["V8/QJS"],y-.1,case+" V8/QJS")
        plotted(d["octane"]["pairwise"][case]["JSC/QJS"],y+.1,case+" JSC/QJS")
    for r in d["whitebox"]["contrasts"]:
        plotted(r["B/A"],{"quickjs":3,"v8":2,"jsc":1}[r["engine"]],"whitebox "+r["group"]+r["engine"])
    for variant in ("A","B"):
        for engine,base in (("quickjs",6),("v8",4),("jsc",2)):
            y=base-(variant=="B")
            s=d["richards"]["statistics"][variant][engine]
            for field in ("Q1","Q3","median"):
                plotted(s[field],y,"Richards "+variant+engine+field)
    for label,section in (("SunSpider","sunspider"),("Octane","octane")):
        for r in d[section]["aggregates"]:
            if r["subset"] in ("all_complete","without:RegExp","without_RegExp_CodeLoad"):
                check(label+" displayed GM "+r["subset"]+r["pair"],f'{r["GM"]:.6f}'.lstrip("0") in tex)
    for case,ratio in d["code_cache"]["ratios"].items():
        check("cache displayed ratio "+case,f'{ratio:.6f}' in tex)
    check("cache GM displayed",f'{d["code_cache"]["GM"]:.6f}' in tex)
    for engine,c in d["richards"]["contrasts"].items():
        check("Richards percent displayed "+engine,f'{c["reduction_percent"]:.2f}\\%' in tex)
        sA=d["richards"]["statistics"]["A"][engine]["median"]
        sB=d["richards"]["statistics"]["B"][engine]["median"]
        check("Richards table medians "+engine,f'{sA:.4f}' in tex and f'{sB:.4f}' in tex)
        check("Richards ratio "+engine,f'{c["B/A"]:.4f}' in tex)
    for v,ratio in d["richards"]["QJS/V8"].items():
        check("Richards QJS/V8 "+v,f'{ratio:.3f}' in tex)
    notes=(OUT/"speaker_notes.md").read_text(encoding="utf-8")
    source_map=(OUT/"source_map.md").read_text(encoding="utf-8")
    check("15 speaker-note questions",notes.count("这页想回答的问题")==15)
    check("all original case medians in source map",all(str(d["octane"]["statistics"][c][e]["median"]) in source_map
          for c in ("Richards.Richards","NavierStokes.NavierStokes","RegExp.RegExp") for e in ("quickjs","v8","jsc")))
    changed=[]
    for relative,identity in d["source_inputs"].items():
        path=ROOT/relative
        if hashlib.sha256(path.read_bytes()).hexdigest()!=identity["sha256"]:changed.append(relative)
    check("all audit input bytes preserved",not changed,{"files":len(d["source_inputs"]),"changed":changed})
    archive=OUT/"weekly_20261008_overleaf.zip"
    members=("main.tex","README_Overleaf.md")
    # Derived package is recreated only in the new report directory, never reads raw/runtime.
    with zipfile.ZipFile(archive,"w",compression=zipfile.ZIP_DEFLATED) as z:
        for member in members:z.write(OUT/member,member)
    with zipfile.ZipFile(archive) as z:
        check("minimal ZIP root/no self/raw/runtime",sorted(z.namelist())==sorted(members))
        check("ZIP exact source identity",z.read("main.tex")== (OUT/"main.tex").read_bytes())
        check("ZIP CRC",z.testzip() is None)
    status="PASS" if all(c["status"]=="PASS" for c in CHECKS) else "FAIL"
    d["validation"]["static_source_check"]=status
    d["validation"]["used_input_preservation"]="PASS" if not changed else "FAIL"
    d["validation"]["report_frames"]={"main":11,"appendix":4,"source_total":15,"actual_PDF_pages":None}
    d["validation"]["compile_error_missing_glyph_Overfull_reference_checks"]="NOT_RUN"
    d["report_artifacts"]={member:hashlib.sha256((OUT/member).read_bytes()).hexdigest()
         for member in ("main.tex","speaker_notes.md","source_map.md","README_Overleaf.md","weekly_20261008_overleaf.zip")}
    data_path.write_text(json.dumps(d,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    result={"static_status":status,"checks":CHECKS,"local_compile":"NOT_RUN","PDF_render_visual_review":"NOT_RUN",
            "TeX_geometry_check":"NOT_RUN; static structure and conservative source layout only, no actual typesetting",
            "zip_members":list(members),"zip_SHA256":hashlib.sha256(archive.read_bytes()).hexdigest(),
            "actual_PDF_pages":None,"data_audit_SHA256":hashlib.sha256(data_path.read_bytes()).hexdigest()}
    (OUT/"validation.json").write_text(json.dumps(result,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    print(json.dumps({"static_status":status,"checks":len(CHECKS),"failed":[c for c in CHECKS if c["status"]=="FAIL"],
                      "source_frames":len(frames),"ZIP":str(archive),"compile":"NOT_RUN"},ensure_ascii=False,indent=2))
    raise SystemExit(0 if status=="PASS" else 1)


if __name__=="__main__":
    main()
