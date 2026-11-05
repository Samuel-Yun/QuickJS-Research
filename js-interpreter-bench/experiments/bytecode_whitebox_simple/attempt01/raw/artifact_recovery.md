Additional diagnostic recovery, 2026-10-15:

- The initial native mapping parser assumed a log range was the executable
  PT_LOAD base; its bounds assertion rejected that assumption before any
  disassembly was accepted. Recovery uses the same live process's /proc/maps
  with ELF offset/vaddr, and objdump identifies Builtins_*Handler symbols.
- An initial live mapping helper omitted the pathlib import. Its generated log
  is retained; successful recovery uses live_code_events_attempt02.log. No
  native branch counts or profiling times are reported.
- WSL boot IDs changed between later diagnostics; /tmp diagnostic binaries did
  not survive. Preserved old build/count records; repeated the independent
  diagnostic build in /home/mzyx/bytecode_whitebox_simple_attempt01_diag and
  stored new *_persistent.json records. The main timing binaries never changed.
- The optional qjsc representation check initially lacked an output directory;
  the failed command/stderr is retained. Recovery records use *_attempt02.json.
  A later write-once guard also caught two different names for the same JSON
  identity field; corrected the exporter schema, not the source/observations.
  No failed formal sample was removed and no extra formal sample was collected.
