function readX(o){return o.x;}
function local(o){var p=o;return p.x+1;}
function method(o){return o.m();}
function branch(o,v){if(v)return o.x;return o.y;}
function catcher(o){try{return o.x;}catch(e){return e.message;}}
var out=[],a={x:3},b={x:7,z:0};
for(var i=0;i<12;i++)out.push(readX(i&1?a:b));
out.push(local(a),local(b),branch(a,true),branch({y:9},false));
out.push(method({x:12,m:function(){return this.x;}}));
var getters=0;
out.push(readX({get x(){getters++;return 11;}}));
out.push(catcher({get x(){throw Error('caught');}}));
out.push(readX(new Proxy({x:15},{get:function(t,k,r){return Reflect.get(t,k,r);}})));
function fail(o){return o.x;}
try{fail(null);}catch(e){out.push(e.stack.replace(/d16_cases\.js/g,'INPUT'));}
// Mixed short/wide fields in one large, straight-line function.
var source='(function(o){';
for(var i=0;i<5000;i++)source+='o.x;';
source+='return o.x;})';
var huge=eval(source);out.push(huge(a),huge(b),getters);
print(JSON.stringify(out));
