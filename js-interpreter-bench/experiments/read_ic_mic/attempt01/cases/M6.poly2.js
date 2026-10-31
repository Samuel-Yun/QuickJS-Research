function polyRead2(o){return o.x;}
function polyLoop2(objects){var sum=0;for(var i=0;i<4096;i++)sum+=polyRead2(objects[i&1]);return sum;}
var microObjects=[];
for(var mj=0;mj<2;mj++){var mo={};for(var mk=0;mk<=mj;mk++)mo['pad'+mj+'_'+mk]=mk;mo.x=mj+1;microObjects.push(mo);}
function microRun(){return polyLoop2(microObjects);}
function microValidate(result){if(result!==6144)throw Error('poly2 checksum');}
