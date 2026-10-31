var __rftPrev=benchNow(),__rftBack=0,__rftPositive=[];
for(var __rftJ=0;__rftJ<20000;__rftJ++){var __rftT=benchNow(),__rftD=__rftT-__rftPrev;if(__rftD<0)__rftBack++;if(__rftD>0)__rftPositive.push(__rftD);__rftPrev=__rftT;}
__rftPositive.sort(function(a,b){return a-b;});
console.log('CLOCK '+JSON.stringify({backward:__rftBack,positive:__rftPositive.length,min_ms:__rftPositive[0],median_ms:__rftPositive[(__rftPositive.length/2)|0]}));
