function inner(o){return o.z;}
function outer(o){return o.x;}
function after(o){return o.y;}
var gets=0, obj={get x(){gets++;if(gets===2)throw Error('sentinel');return inner({z:7});}};
if(outer(obj)!==7)throw Error('getter');
try{outer(obj);throw Error('missing throw');}catch(e){if(e.message!=='sentinel')throw e;}
if(after({y:9})!==9||gets!==2)throw Error('after');
console.log('CONTEXT_PASS');
