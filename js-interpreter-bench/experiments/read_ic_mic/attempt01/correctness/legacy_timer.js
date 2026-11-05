var clock = performance.now.bind(performance);
var previous=clock(), minimum=Infinity, steps=0;
for(var i=0;i<100000;i++) {
  var current=clock(),delta=current-previous;
  if(delta<0)throw Error('backwards clock');
  if(delta>0){minimum=Math.min(minimum,delta);steps++;}
  previous=current;
}
var t=clock(),spin=0;
while(clock()-t<150)spin++;
console.log(JSON.stringify({timer:'native performance.now/CLOCK_MONOTONIC',observed_min_step_ms:minimum,
  positive_steps:steps,busy_interval_ms:clock()-t,spin:spin}));
