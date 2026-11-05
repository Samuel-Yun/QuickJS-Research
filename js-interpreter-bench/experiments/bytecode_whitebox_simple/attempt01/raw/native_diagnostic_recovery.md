The actual d8 help advertises --print-builtin-code, but setting it aborts with a
readonly-flag error (exit -6). All five original failures and stderr retained;
no performance flags were changed. A --log-code-only diagnostic then produced
code events but no shared-library mapping; preserved its record as well.
The recovered diagnostic adds --prof only to request the Linux library mapping,
uses code-creation/BytecodeHandler addresses and ELF PT_LOAD data for objdump.
Neither the profiler ticks nor this diagnostic's timing enter formal statistics.
Code-creation records say what code exists, not which branch actually ran.
