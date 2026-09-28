var hp=typeof performance!=='undefined' && typeof performance.now==='function';
function probe(f){var prev=f(),min=Infinity,back=0,changes=0;var until=Date.now()+80;
while(Date.now()<until){var cur=f();if(cur<prev)back++;if(cur>prev){min=Math.min(min,cur-prev);changes++;}prev=cur;}
return {min_positive_delta_ms:isFinite(min)?min:null,backwards:back,changes:changes};}
console.log('TIMER_PROBE:'+JSON.stringify({native_performance_now:hp,date:probe(Date.now),
performance:hp?probe(function(){return performance.now();}):null}));
