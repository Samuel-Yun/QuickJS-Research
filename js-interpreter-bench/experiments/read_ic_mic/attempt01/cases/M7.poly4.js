function polyRead4(o){return o.x;}
function polyLoop4(objects){var sum=0;for(var i=0;i<4096;i++)sum+=polyRead4(objects[i&3]);return sum;}
var microObjects=[];
for(var mj=0;mj<4;mj++){var mo={};for(var mk=0;mk<=mj;mk++)mo['pad'+mj+'_'+mk]=mk;mo.x=mj+1;microObjects.push(mo);}
function microRun(){return polyLoop4(microObjects);}
function microValidate(result){if(result!==10240)throw Error('poly4 checksum');}
