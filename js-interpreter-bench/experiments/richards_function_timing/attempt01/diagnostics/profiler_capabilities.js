console.log('CAPABILITIES '+JSON.stringify({
console:Object.getOwnPropertyNames(console),
d8:typeof d8==='object'?Object.getOwnPropertyNames(d8):[],
profiler:typeof d8==='object' && d8.profiler?Object.getOwnPropertyNames(d8.profiler):[]}));
