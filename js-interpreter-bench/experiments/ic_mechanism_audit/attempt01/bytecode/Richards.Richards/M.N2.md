# M Richards.Richards N=2: final compiled bytes before execution / before function free
Diagnostic binary only; offsets are real opcode starts. Source identity and instance are recorded. Atom IDs/site indices are process-local.

## TaskControlBlock.prototype.isHeldOrSuspended, instance 48
Source SHA256: 69d692d6d84a116d2415efdd3219009659a0266edd7ecbd0d1e83a51ca9d39b5
```javascript
function () {
  return (this.state & STATE_HELD) != 0 || (this.state == STATE_SUSPENDED);
}
```
```text
pc size before-op before-operand -> after-op after-operand [property]
   0 1 push_this -> push_this []
   1 1 put_loc0 -> put_loc0 []
   2 1 get_loc0 -> get_loc0 []
   3 5 get_field_rdi 0 -> get_field_rdi 0 [state]
   8 3 get_var -> get_var []
  11 1 and -> and []
  12 1 push_0 -> push_0 []
  13 1 neq -> neq []
  14 1 dup -> dup []
  15 2 if_true8 -> if_true8 []
  17 1 drop -> drop []
  18 1 get_loc0 -> get_loc0 []
  19 5 get_field_rdi 1 -> get_field_rdi 1 [state]
  24 3 get_var -> get_var []
  27 1 eq -> eq []
  28 1 return -> return []
```
For non-5-byte operands see the raw hex below; zero exported operand is not a decoded immediate.
before: `08c7c3f400000000380000abb3a811e90c0ec3f401000000380100a728`
after: `08c7c3f400000000380000abb3a811e90c0ec3f401000000380100a728`
