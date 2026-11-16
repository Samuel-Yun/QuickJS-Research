# B M1.own_integer N=1: final compiled bytes before execution / before function free
Diagnostic binary only; offsets are real opcode starts. Source identity and instance are recorded. Atom IDs/site indices are process-local.

## m1Read, instance 3
Source SHA256: a56cb8c0530ec201fefd68e9d75d5d56daa79ed3f4bbc2596ff60070681da946
```javascript
function m1Read(obj) {
  var sum=0;
  for(var i=0;i<4096;i++) sum+=obj.x;
  return sum;
}
```
```text
pc size before-op before-operand -> after-op after-operand [property]
   0 1 push_0 -> push_0 []
   1 1 put_loc0 -> put_loc0 []
   2 1 push_0 -> push_0 []
   3 1 put_loc1 -> put_loc1 []
   4 1 get_loc1 -> get_loc1 []
   5 3 push_i16 -> push_i16 []
   8 1 lt -> lt []
   9 2 if_false8 -> if_false8 []
  11 1 get_loc0 -> get_loc0 []
  12 1 get_arg0 -> get_arg0 []
  13 5 get_field 626 -> get_field_ic 0 [x]
  18 1 add -> add []
  19 1 put_loc0 -> put_loc0 []
  20 2 inc_loc -> inc_loc []
  22 2 goto8 -> goto8 []
  24 1 get_loc0 -> get_loc0 []
  25 1 return -> return []
```
For non-5-byte operands see the raw hex below; zero exported operand is not a decoded immediate.
before: `b3c7b3c8c4bc0010a1e80ec3cf3d720200009bc79101eaedc328`
after: `b3c7b3c8c4bc0010a1e80ec3cff4000000009bc79101eaedc328`
