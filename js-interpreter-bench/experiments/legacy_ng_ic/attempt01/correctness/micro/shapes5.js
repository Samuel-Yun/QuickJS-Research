
function microRead(o){return o.x;}
var objects=[],sum=0,expected=0;
for(var j=0;j<5;j++){var o={};o['extra'+j]=j;o.x=j+1;objects.push(o);}
for(var i=0;i<8000;i++){sum+=microRead(objects[i%5]);expected+=i%5+1;}
if(sum!==expected)throw Error('wrong checksum');
console.log('MICRO_PASS '+sum);
