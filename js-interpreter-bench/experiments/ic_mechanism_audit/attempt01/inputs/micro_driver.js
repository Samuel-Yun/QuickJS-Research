;(function(){
 var count=__N__,last,checksum=0,start=null,stop=null;
 if(__CHECK__){for(var j=0;j<count;j++){last=microRun();microValidate(last);checksum+=last;}}
 else{start=benchNow();for(var j=0;j<count;j++){last=microRun();checksum+=last;}stop=benchNow();microValidate(last);}
 if(!Number.isFinite(checksum)||checksum!==count*__EXPECTED__)throw Error('checksum');
 console.log('TEB_RESULT:'+JSON.stringify({case:__CASE__,N:count,mode:__MODE__,phase:__PHASE__,
 correctness:'PASS',checksum:checksum,last:last,start_ms:start,stop_ms:stop,elapsed_ms:start===null?null:stop-start,
 warmup_calls:0,inner_iterations:4096,first_Run_included:true}));
})();
