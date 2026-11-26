function m5Write(obj) {
  for(var i=0;i<4096;i++)obj.x=i;
  return i;
}
var microObject={x:0};
function microRun(){return m5Write(microObject);}
function microValidate(result){if(result!==4096||microObject.x!==4095)throw Error('M5 result');}
