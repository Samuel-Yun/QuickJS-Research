"""Recover existing embedded handler addresses from code events, then ELF objdump.
No profiling times and no claim that every native branch was executed.
"""
import csv
import io
import struct
import json
import subprocess
from pathlib import Path
from run import HERE, capture, command, manifest, save, script, sha, verify, read


def main():
    verify()
    record=HERE/"raw/diagnostics/v8_live_mapping_attempt02.json"
    logfile=HERE/"bytecode/v8_native/live_code_events_attempt02.log"
    if record.exists():
        live=read(record)
    else:
        p=HERE/"probes/v8_live_mapping.js"
        save(p,script("prototype_method",1,"native_diagnostic").read_text()+"\nprint('MAPPING_READY'); readline();\n")
        cmd=command("v8",p,("--prof","--log-code","--no-logfile-per-isolate","--logfile="+str(logfile)))
        child=subprocess.Popen(cmd,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
        before=[]
        while True:
            line=child.stdout.readline()
            if not line:
                raise RuntimeError("mapping sentinel not reached")
            before.append(line)
            if line.strip()=="MAPPING_READY": break
        maps=Path(f"/proc/{child.pid}/maps").read_text()
        tail,stderr=child.communicate("\n",timeout=30)
        live=dict(command=cmd,pid=child.pid,maps=maps,stdout="".join(before)+tail,stderr=stderr,exit_code=child.returncode)
        save(record,live)
    assert live["exit_code"]==0
    events = list(csv.reader(io.StringIO(logfile.read_text())))
    binary = manifest()["engines"]["v8"]["binary"]["path"]
    mapping = next(x for x in events if len(x)>4 and x[0]=="shared-library" and x[1]==binary)
    # Use the actual process maps, not an assumed meaning of the log's range.
    data = open(binary,"rb").read()
    assert data[:6]==b'\x7fELF\x02\x01'
    phoff = struct.unpack_from("<Q",data,32)[0]
    entsize, count = struct.unpack_from("<HH",data,54)
    loads = []
    for i in range(count):
        typ,flags,offset,vaddr,paddr,filesz,memsz,align = struct.unpack_from("<IIQQQQQQ",data,phoff+i*entsize)
        if typ==1 and flags&1:
            loads.append(dict(offset=offset,vaddr=vaddr,filesz=filesz,memsz=memsz))
    process_map=next(line for line in live["maps"].splitlines() if binary in line and "r-xp" in line)
    fields=process_map.split();map_start=int(fields[0].split('-')[0],16);map_offset=int(fields[2],16)
    segment=next(x for x in loads if (x['offset']&~4095)==map_offset)
    bias=map_start-(segment['vaddr']&~4095)
    desired=("Ldar","Star0","Mov","TestLessThan","GetNamedProperty","CallProperty1","Add","Inc","JumpLoop")
    mapped = []
    for name in desired:
        ev=next(x for x in events if len(x)>6 and x[:2]==["code-creation","BytecodeHandler"] and x[6]==name)
        va=int(ev[4],16)-bias;size=int(ev[5])
        assert any(x["vaddr"]<=va and va+size<=x["vaddr"]+x["filesz"] for x in loads)
        native=capture(HERE/"raw/diagnostics"/("objdump_v8_"+name+".json"),
                       ["objdump","-d","-M","intel",f"--start-address={va}",f"--stop-address={va+size}",binary])
        assert native["exit_code"]==0
        save(HERE/"bytecode/v8_native"/(name+".disassembly.txt"),native["stdout"])
        mapped.append(dict(handler=name,kind="BytecodeHandler",log_address=ev[4],elf_vaddr=hex(va),size_bytes=size))
    save(HERE/"source_evidence/v8_native_map.json",dict(binary_sha256=sha(binary),mapping=mapping,actual_proc_map=process_map,
         executable_PT_LOAD=loads,load_bias=hex(bias),handlers=mapped,
         limitation="code creation identifies available embedded code; not a dynamic branch/hit profile"))
    print("MAPPED",len(mapped),"actual V8 embedded handlers",flush=True)


if __name__=="__main__":
    main()
