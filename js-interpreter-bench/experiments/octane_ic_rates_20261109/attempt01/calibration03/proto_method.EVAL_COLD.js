var proto={m:function(){return 3}};var o=Object.create(proto);function run(o){var s=0;for(var i=0;i<16;i++)s+=o.m();return s;}
__oct_count_begin();
var value=run(o);
__oct_count_end();
if(value!==48)throw Error("checksum");print("PASS");