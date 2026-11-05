"""Initial host and frozen object inventory only."""
from common import *
def main():
    if not (HERE/'started.json').exists():save(HERE/'started.json',dict(timestamp=stamp(),budget_seconds=14400,sampler_setup_budget_seconds=3600,note='initial repository/document reading approximately 4 minutes before this checkpoint'))
    old=read(PREV/'manifest.json');src=Path(old['A_source']);binary=old['artifacts']['QJS_A'];assert sha(binary['path'])==binary['sha256']=='584335adb82c6052395e5a9526ca1be05480d5d8e60469fd14403156b62a8dd1'
    save(HERE/'initial.json',dict(host=platform.node(),kernel=platform.release(),architecture=platform.machine(),source=str(src),binary=binary,objects=[dict(path=str(p),sha256=sha(p),bytes=p.stat().st_size) for p in src.rglob('*.o')]))
    capture('environment',['sh','-c','uname -a; cat /etc/os-release; lscpu; free -b; uptime; ps -eo pid,stat,comm,pcpu,args; gcc --version; true'])
    capture('elf_header',['readelf','-h',binary['path']])
    capture('make_dry_run',['make','-n','-B','qjs'],cwd=src)
    capture('base_call_disasm',['objdump','-d','-Mintel','--disassemble=JS_CallInternal',binary['path']])
    capture('base_call_source',['sed','-n','17740,17890p',str(src/'quickjs.c')])
    print('OBJECTS',len(list(src.rglob('*.o'))),flush=True)
if __name__=='__main__':main()
