
function microRead(o){return o.x;}
var objects=[],sum=0,expected=0;
for(var j=0;j<2;j++){var o={};o['extra'+j]=j;o.x=j+1;objects.push(o);}
for(var i=0;i<8000;i++){sum+=microRead(objects[i%2]);expected+=i%2+1;}
if(sum!==expected)throw Error('wrong checksum');
console.log('MICRO_PASS '+sum);
