function m1Read(obj) {
  var sum=0;
  for(var i=0;i<4096;i++) sum+=obj.x;
  return sum;
}
var microObject={x:3};
function microRun(){return m1Read(microObject);}
function microValidate(result){if(result!==12288)throw Error('M1 expected 12288');}
