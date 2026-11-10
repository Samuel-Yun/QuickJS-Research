var inner={y:3};var o={get x(){return inner.y;}};function run(o){var s=0;for(var i=0;i<16;i++)s+=o.x;return s;}
__oct_count_begin();
var result=run(o);
__oct_count_end();
if(result!==48)throw Error("checksum");print("CHECK_PASS");
