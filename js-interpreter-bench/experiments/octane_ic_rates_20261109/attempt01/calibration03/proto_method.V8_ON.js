var proto={m:function(){return 3}};var o=Object.create(proto);function run(o){var s=0;for(var i=0;i<16;i++)s+=o.m();return s;}
%SystemBreak();
var value=run(o);
%SystemBreak();
if(value!==48)throw Error("checksum");print("PASS");