function m1Read(obj) {
  var sum=0;
  for(var i=0;i<4096;i++) sum+=obj.x;
  return sum;
}
var microObject={x:3};
function microRun(){return m1Read(microObject);}
function microValidate(result){if(result!==12288)throw Error('M1 expected 12288');}

;
function m2Read(obj,anchor) {
  var count=0;
  for(var i=0;i<4096;i++) if(obj.x===anchor)count++;
  return count;
}
var microAnchor={},microObject={x:microAnchor};
function microRun(){return m2Read(microObject,microAnchor);}
function microValidate(result){if(result!==4096)throw Error('M2 expected 4096');}

;
function m4Loop(limit) {
  var sum=0;
  for(var i=0;i<limit;i++)sum+=i;
  return sum;
}
function microRun(){return m4Loop(4096);}
function microValidate(result){if(result!==8386560)throw Error('M4 expected 8386560');}

;
function polyRead2(o){return o.x;}
function polyLoop2(objects){var sum=0;for(var i=0;i<4096;i++)sum+=polyRead2(objects[i&1]);return sum;}
var microObjects=[];
for(var mj=0;mj<2;mj++){var mo={};for(var mk=0;mk<=mj;mk++)mo['pad'+mj+'_'+mk]=mk;mo.x=mj+1;microObjects.push(mo);}
function microRun(){return polyLoop2(microObjects);}
function microValidate(result){if(result!==6144)throw Error('poly2 checksum');}

console.log("SELECTOR_OK");
