from common import *
import extra
if __name__=='__main__':
    inspection=read(HERE/'interrupted_prepare_inspection.json')
    assert not inspection['sanitizer_binary_exists']
    save(HERE/'gates/sanitizer.json',dict(status='NOT_COMPLETED_BUILD_INTERRUPTED',new_binary_tested=False,
       previous_session_boot=read(HERE/'raw/commands/serial.read.ON.json')['boot_id'],inspection_boot=inspection['boot_id'],
       cause='UNKNOWN; WSL frontend exit1, new boot on inspection, zero-byte quickjs.o, no completed build log',
       old_H_targeted_sanitizer='PASS in prior H; not substituted as new-switch PASS',
       scope='optional new check; no new allocation/reference algorithm; explicit limitation',retry_large_build=False))
    extra.assembly()
    print('PREPARATION_COMPLETE_WITH_SANITIZER_LIMITATION',flush=True)
