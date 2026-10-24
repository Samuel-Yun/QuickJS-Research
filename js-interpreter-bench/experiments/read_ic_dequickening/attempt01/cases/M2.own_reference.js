function m2Read(obj,anchor) {
  var count=0;
  for(var i=0;i<4096;i++) if(obj.x===anchor)count++;
  return count;
}
var microAnchor={},microObject={x:microAnchor};
function microRun(){return m2Read(microObject,microAnchor);}
function microValidate(result){if(result!==4096)throw Error('M2 expected 4096');}
