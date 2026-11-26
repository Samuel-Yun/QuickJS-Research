
function microShared(a,b){var x=a.x;return x+b.x;}
var a={x:1,z:2},b={z:3,x:4},sum=0;
for(var i=0;i<8000;i++)sum+=microShared(a,b);
if(sum!==40000)throw Error('wrong checksum');
console.log('MICRO_PASS '+sum);
