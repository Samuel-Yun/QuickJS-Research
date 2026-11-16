# M original SplayTree.prototype.splay_
Diagnostic export; final executable bytecode after compilation/prepare, before Run.
Source SHA256: 138762086ed599b42111191883e57a62e65533df210601253b636eddb39abd43
```javascript
function(key) {
  if (this.isEmpty()) {
    return;
  }
  // Create a dummy node.  The use of the dummy node is a bit
  // counter-intuitive: The right child of the dummy node will hold
  // the L tree of the algorithm.  The left child of the dummy node
  // will hold the R tree of the algorithm.  Using a dummy node, left
  // and right will always be nodes and we avoid special cases.
  var dummy, left, right;
  dummy = left = right = new SplayTree.Node(null, null);
  var current = this.root_;
  while (true) {
    if (key < current.key) {
      if (!current.left) {
        break;
      }
      if (key < current.left.key) {
        // Rotate right.
        var tmp = current.left;
        current.left = tmp.right;
        tmp.right = current;
        current = tmp;
        if (!current.left) {
          break;
        }
      }
      // Link right.
      right.left = current;
      right = current;
      current = current.left;
    } else if (key > current.key) {
      if (!current.right) {
        break;
      }
      if (key > current.right.key) {
        // Rotate left.
        var tmp = current.right;
        current.right = tmp.left;
        tmp.left = current;
        current = tmp;
        if (!current.right) {
          break;
        }
      }
      // Link left.
      left.right = current;
      left = current;
      current = current.right;
    } else {
      break;
    }
  }
  // Assemble.
  left.right = current.left;
  right.left = current.right;
  current.left = dummy.right;
  current.right = dummy.left;
  this.root_ = current;
}
```
pc | opcode | property | raw operand bytes (not a complete operand decoder)
```text
   0 push_this                                 
   1 put_loc8                                  05
   3 get_loc8                                  05
   5 get_field2_rdi           isEmpty          00000000
  10 call_method                               0000
  13 if_false8                                 02
  15 return_undef                              
  16 get_var                                   0000
  19 get_field_rdi            Node             01000000
  24 dup                                       
  25 null                                      
  26 null                                      
  27 call_constructor                          0200
  30 set_loc2                                  
  31 set_loc1                                  
  32 put_loc0                                  
  33 get_loc8                                  05
  35 get_field_rdi            root_            02000000
  40 put_loc3                                  
  41 get_arg0                                  
  42 get_loc3                                  
  43 get_field_rdi            key              03000000
  48 lt                                        
  49 if_false8                                 56
  51 get_loc3                                  
  52 get_field_rdi            left             04000000
  57 lnot                                      
  58 if_true                                   aa000000
  63 get_arg0                                  
  64 get_loc3                                  
  65 get_field_rdi            left             05000000
  70 get_field_rdi            key              06000000
  75 lt                                        
  76 if_false8                                 29
  78 get_loc3                                  
  79 get_field_rdi            left             07000000
  84 put_loc8                                  04
  86 get_loc3                                  
  87 get_loc8                                  04
  89 get_field_rdi            right            08000000
  94 put_field                left             cd020000
  99 get_loc8                                  04
 101 get_loc3                                  
 102 put_field                right            ce020000
 107 get_loc8                                  04
 109 set_loc3                                  
 110 get_field_rdi            left             09000000
 115 lnot                                      
 116 if_true8                                  70
 118 get_loc2                                  
 119 get_loc3                                  
 120 put_field                left             cd020000
 125 get_loc3                                  
 126 put_loc2                                  
 127 get_loc3                                  
 128 get_field_rdi            left             0a000000
 133 put_loc3                                  
 134 goto8                                     a2
 136 get_arg0                                  
 137 get_loc3                                  
 138 get_field_rdi            key              0b000000
 143 gt                                        
 144 if_false8                                 54
 146 get_loc3                                  
 147 get_field_rdi            right            0c000000
 152 lnot                                      
 153 if_true8                                  4b
 155 get_arg0                                  
 156 get_loc3                                  
 157 get_field_rdi            right            0d000000
 162 get_field_rdi            key              0e000000
 167 gt                                        
 168 if_false8                                 29
 170 get_loc3                                  
 171 get_field_rdi            right            0f000000
 176 put_loc8                                  04
 178 get_loc3                                  
 179 get_loc8                                  04
 181 get_field_rdi            left             10000000
 186 put_field                right            ce020000
 191 get_loc8                                  04
 193 get_loc3                                  
 194 put_field                left             cd020000
 199 get_loc8                                  04
 201 set_loc3                                  
 202 get_field_rdi            right            11000000
 207 lnot                                      
 208 if_true8                                  14
 210 get_loc1                                  
 211 get_loc3                                  
 212 put_field                right            ce020000
 217 get_loc3                                  
 218 put_loc1                                  
 219 get_loc3                                  
 220 get_field_rdi            right            12000000
 225 put_loc3                                  
 226 goto16                                    46ff
 229 get_loc1                                  
 230 get_loc3                                  
 231 get_field_rdi            left             13000000
 236 put_field                right            ce020000
 241 get_loc2                                  
 242 get_loc3                                  
 243 get_field_rdi            right            14000000
 248 put_field                left             cd020000
 253 get_loc3                                  
 254 get_loc0                                  
 255 get_field_rdi            right            15000000
 260 put_field                left             cd020000
 265 get_loc3                                  
 266 get_loc0                                  
 267 get_field_rdi            left             16000000
 272 put_field                right            ce020000
 277 get_loc8                                  05
 279 get_loc3                                  
 280 put_field                root_            e1020000
 285 return_undef                              
```
Full executable bytes: 08c105c005f500000000240000e80229380000f401000000110707210200cdccc7c005f402000000cacfc6f403000000a1e856c6f4040000009469aa000000cfc6f405000000f406000000a1e829c6f407000000c104c6c004f4080000003fcd020000c004c63fce020000c004cef40900000094e970c5c63fcd020000c6c9c6f40a000000caeaa2cfc6f40b000000a3e854c6f40c00000094e94bcfc6f40d000000f40e000000a3e829c6f40f000000c104c6c004f4100000003fce020000c004c63fcd020000c004cef41100000094e914c4c63fce020000c6c8c6f412000000caeb46ffc4c6f4130000003fce020000c5c6f4140000003fcd020000c6c3f4150000003fcd020000c6c3f4160000003fce020000c005c63fe102000029
