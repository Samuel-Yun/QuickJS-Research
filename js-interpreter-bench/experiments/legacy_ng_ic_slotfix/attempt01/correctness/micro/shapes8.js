function microRead(o){return o.x;}
var objects=[],sum=0,expected=0;
for(var j=0;j<8;j++){var o={};o['extra'+j]=j;o.x=j+1;objects.push(o);}
for(var i=0;i<8000;i++){sum+=microRead(objects[i%8]);expected+=i%8+1;}
if(sum!==expected)throw Error('checksum');console.log('MICRO_PASS '+sum);
