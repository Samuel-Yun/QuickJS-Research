function microRead(o){return o.x;}
var objects=[],sum=0,expected=0;
for(var j=0;j<1;j++){var o={};o['extra'+j]=j;o.x=j+1;objects.push(o);}
for(var i=0;i<8000;i++){sum+=microRead(objects[i%1]);expected+=i%1+1;}
if(sum!==expected)throw Error('checksum');console.log('MICRO_PASS '+sum);
