/* Public QuickJS workload selector; independently read from frozen M. */
static const char fs_source_1[]="function m1Read(obj) {\n  var sum=0;\n  for(var i=0;i<4096;i++) sum+=obj.x;\n  return sum;\n}";
/* SHA256 a56cb8c0530ec201fefd68e9d75d5d56daa79ed3f4bbc2596ff60070681da946; true PC 13 */
static const char fs_source_2[]="function m2Read(obj,anchor) {\n  var count=0;\n  for(var i=0;i<4096;i++) if(obj.x===anchor)count++;\n  return count;\n}";
/* SHA256 4ad365d05e56b58c14b49f3cf1bba4fa33ccebc87c4c96e13ad3e1bf3c8a7037; true PC 12 */
