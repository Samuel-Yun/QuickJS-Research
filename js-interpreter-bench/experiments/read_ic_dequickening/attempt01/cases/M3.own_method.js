function m3Step(x){return x+this.bias;}
function m3Call(obj) {
  var sum=0;
  for(var i=0;i<4096;i++)sum+=obj.step(i);
  return sum;
}
var microObject={bias:3,step:m3Step};
function microRun(){return m3Call(microObject);}
function microValidate(result){if(result!==8398848)throw Error('M3 expected 8398848');}
