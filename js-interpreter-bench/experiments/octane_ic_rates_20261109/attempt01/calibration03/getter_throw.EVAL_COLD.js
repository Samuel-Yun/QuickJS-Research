var inner={y:3},tick=0;var o={get x(){if(tick++===0)throw Error("sentinel");return inner.y;}};function run(o){var s=0;for(var i=0;i<16;i++){try{s+=o.x}catch(e){}}return s;}
__oct_count_begin();
var value=run(o);
__oct_count_end();
if(value!==45)throw Error("checksum");print("PASS");