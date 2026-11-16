function run(o){var s=0;for(var i=0;i<16;i++)s+=o.x+o.length;return s;} var o={x:3,length:7};
%SystemBreak();
var result=run(o);
%SystemBreak();
if(result!==160)throw Error("checksum");print("CHECK_PASS");
