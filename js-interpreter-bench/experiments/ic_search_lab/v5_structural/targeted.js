/* These assertions are targeted scenarios, not 6019 independent tests. */
var checks = 0;
function eq(a, b) { checks++; if (a !== b) throw Error('structural '+checks+' '+a+' != '+b); }
function argRead(o) { return o.value; }
function localRead(o) { var p=o; return p.value; }
function method(o) { return o.step(2); }
function plain(o) { return o.value; }
var objects = [];
for (var i=0;i<8;i++) {
    var o={};
    for (var j=0;j<i;j++) o['pad'+j]=j;
    o.value=i;
    objects.push(o);
}
for (i=0;i<2000;i++) { o=objects[i%8]; eq(argRead(o),i%8); eq(localRead(o),i%8); eq(plain(o),i%8); }
var p={value:3, step:function(x){return x+this.bias;}};
o=Object.create(p); o.bias=5;
eq(argRead(o),3); eq(argRead(o),3);
p.value=4; eq(argRead(o),4);
Object.defineProperty(p,'value',{get:function(){return this.bias+5;},configurable:true});
eq(argRead(o),10);
Object.defineProperty(p,'value',{value:11,writable:true,configurable:true}); eq(argRead(o),11);
o.value=12; eq(argRead(o),12); delete o.value; eq(argRead(o),11);
delete p.value; eq(argRead(o),undefined);
p.value=14; eq(argRead(o),14);
Object.setPrototypeOf(o,{value:15}); eq(argRead(o),15);
eq(argRead(new Proxy({value:16},{})),16);
Object.setPrototypeOf(o,p); eq(method(o),7);
p.step=function(x){return x+this.bias+1;}; eq(method(o),8);
eq(argRead('abc'),undefined);
var threw=false;try { argRead(null); } catch(e) {threw=true;} eq(threw,true);
Object.defineProperty(o,'value',{get:function(){throw Error('getter');},configurable:true});
threw=false;try {localRead(o);}catch(e){threw=true;}eq(threw,true);
delete o.value;eq(argRead(o),14);
var closure=function(){var v={value:17};return function(){return localRead(v);};}();eq(closure(),17);
eq(checks,6019-1);
print('STRUCTURAL_PASS:'+checks);
