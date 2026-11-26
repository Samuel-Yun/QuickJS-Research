function polyRead8(o){return o.x;}
function polyLoop8(objects){var sum=0;for(var i=0;i<4096;i++)sum+=polyRead8(objects[i&7]);return sum;}
var microObjects=[];
for(var mj=0;mj<8;mj++){var mo={};for(var mk=0;mk<=mj;mk++)mo['pad'+mj+'_'+mk]=mk;mo.x=mj+1;microObjects.push(mo);}
function microRun(){return polyLoop8(microObjects);}
function microValidate(result){if(result!==18432)throw Error('poly8 checksum');}
