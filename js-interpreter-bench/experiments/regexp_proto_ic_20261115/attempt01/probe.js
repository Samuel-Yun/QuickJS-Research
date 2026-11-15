'use strict';
function invoke(re,s){return re.exec(s);}
var re=/a/;
__snapshot(invoke,'before',re);
__b3_begin();
for(var i=0;i<16;i++){
    var result=invoke(re,'a');
    if(result[0]!=='a')throw Error('match');
}
__b3_end();
__snapshot(invoke,'after',re);
print('B3_PROBE_PASS');
