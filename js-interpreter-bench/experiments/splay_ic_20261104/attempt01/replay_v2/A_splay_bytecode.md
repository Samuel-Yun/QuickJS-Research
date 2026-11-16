# A original SplayTree.prototype.splay_
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
   5 get_field2               isEmpty          e2020000
  10 call_method                               0000
  13 if_false8                                 02
  15 return_undef                              
  16 get_var                                   0000
  19 get_field                Node             e3020000
  24 dup                                       
  25 null                                      
  26 null                                      
  27 call_constructor                          0200
  30 set_loc2                                  
  31 set_loc1                                  
  32 put_loc0                                  
  33 get_loc8                                  05
  35 get_field                root_            e1020000
  40 put_loc3                                  
  41 get_arg0                                  
  42 get_loc3                                  
  43 get_field                key              d7020000
  48 lt                                        
  49 if_false8                                 56
  51 get_loc3                                  
  52 get_field                left             cd020000
  57 lnot                                      
  58 if_true                                   aa000000
  63 get_arg0                                  
  64 get_loc3                                  
  65 get_field                left             cd020000
  70 get_field                key              d7020000
  75 lt                                        
  76 if_false8                                 29
  78 get_loc3                                  
  79 get_field                left             cd020000
  84 put_loc8                                  04
  86 get_loc3                                  
  87 get_loc8                                  04
  89 get_field                right            ce020000
  94 put_field                left             cd020000
  99 get_loc8                                  04
 101 get_loc3                                  
 102 put_field                right            ce020000
 107 get_loc8                                  04
 109 set_loc3                                  
 110 get_field                left             cd020000
 115 lnot                                      
 116 if_true8                                  70
 118 get_loc2                                  
 119 get_loc3                                  
 120 put_field                left             cd020000
 125 get_loc3                                  
 126 put_loc2                                  
 127 get_loc3                                  
 128 get_field                left             cd020000
 133 put_loc3                                  
 134 goto8                                     a2
 136 get_arg0                                  
 137 get_loc3                                  
 138 get_field                key              d7020000
 143 gt                                        
 144 if_false8                                 54
 146 get_loc3                                  
 147 get_field                right            ce020000
 152 lnot                                      
 153 if_true8                                  4b
 155 get_arg0                                  
 156 get_loc3                                  
 157 get_field                right            ce020000
 162 get_field                key              d7020000
 167 gt                                        
 168 if_false8                                 29
 170 get_loc3                                  
 171 get_field                right            ce020000
 176 put_loc8                                  04
 178 get_loc3                                  
 179 get_loc8                                  04
 181 get_field                left             cd020000
 186 put_field                right            ce020000
 191 get_loc8                                  04
 193 get_loc3                                  
 194 put_field                left             cd020000
 199 get_loc8                                  04
 201 set_loc3                                  
 202 get_field                right            ce020000
 207 lnot                                      
 208 if_true8                                  14
 210 get_loc1                                  
 211 get_loc3                                  
 212 put_field                right            ce020000
 217 get_loc3                                  
 218 put_loc1                                  
 219 get_loc3                                  
 220 get_field                right            ce020000
 225 put_loc3                                  
 226 goto16                                    46ff
 229 get_loc1                                  
 230 get_loc3                                  
 231 get_field                left             cd020000
 236 put_field                right            ce020000
 241 get_loc2                                  
 242 get_loc3                                  
 243 get_field                right            ce020000
 248 put_field                left             cd020000
 253 get_loc3                                  
 254 get_loc0                                  
 255 get_field                right            ce020000
 260 put_field                left             cd020000
 265 get_loc3                                  
 266 get_loc0                                  
 267 get_field                left             cd020000
 272 put_field                right            ce020000
 277 get_loc8                                  05
 279 get_loc3                                  
 280 put_field                root_            e1020000
 285 return_undef                              
```
Full executable bytes: 08c105c0053ee2020000240000e802293800003de3020000110707210200cdccc7c0053de1020000cacfc63dd7020000a1e856c63dcd0200009469aa000000cfc63dcd0200003dd7020000a1e829c63dcd020000c104c6c0043dce0200003fcd020000c004c63fce020000c004ce3dcd02000094e970c5c63fcd020000c6c9c63dcd020000caeaa2cfc63dd7020000a3e854c63dce02000094e94bcfc63dce0200003dd7020000a3e829c63dce020000c104c6c0043dcd0200003fce020000c004c63fcd020000c004ce3dce02000094e914c4c63fce020000c6c8c63dce020000caeb46ffc4c63dcd0200003fce020000c5c63dce0200003fcd020000c6c33dce0200003fcd020000c6c33dcd0200003fce020000c005c63fe102000029
