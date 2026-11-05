function twoSites(a,b){return a.x+b.x;}
var a={x:2,z:0},b={z:0,x:3},sum=0;
for(var i=0;i<4096;i++)sum+=twoSites(a,b);
if(sum!==20480)throw Error('sum');console.log('PASS independent sites');
