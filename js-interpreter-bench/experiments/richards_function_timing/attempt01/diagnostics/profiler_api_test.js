d8.profiler.setOnProfileEndListener(function(p){
 console.log('PROFILE_TYPE '+JSON.stringify({type:typeof p,keys:typeof p==='object'?Object.keys(p):null}));
 console.log('CPU_PROFILE '+(typeof p==='string'?p:JSON.stringify(p)));
});
console.profile('rft-capability');
function rftDiagnosticSum(n){var s=0;for(var i=0;i<n;i++)s+=i;return s;}
console.log('TEST_SUM '+rftDiagnosticSum(1000000));
console.profileEnd('rft-capability');
