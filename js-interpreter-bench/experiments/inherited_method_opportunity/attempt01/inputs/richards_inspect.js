// Post-workload diagnosis only. Original Richards functions are not wrapped.
;(function () {
  var entries=[['TCB.isHeldOrSuspended',TaskControlBlock.prototype,'isHeldOrSuspended'],
    ['TCB.run',TaskControlBlock.prototype,'run'],['IdleTask.run',IdleTask.prototype,'run'],
    ['WorkerTask.run',WorkerTask.prototype,'run'],['HandlerTask.run',HandlerTask.prototype,'run'],
    ['DeviceTask.run',DeviceTask.prototype,'run']];
  for(var k=0;k<entries.length;k++) {
    var e=entries[k],d=Object.getOwnPropertyDescriptor(e[1],e[2]);
    if(!d||typeof d.value!=='function')throw Error('prototype descriptor');
    console.log('HOLDER:'+e[0]+':'+JSON.stringify({ownData:true,writable:d.writable,configurable:d.configurable,enumerable:d.enumerable}));
    %DebugPrint(e[1]);%DebugPrint(d.value);
  }
})();
