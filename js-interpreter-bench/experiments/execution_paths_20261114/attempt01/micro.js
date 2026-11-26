'use strict';
function run(){
var mode=scriptArgs[1],n=Number(scriptArgs[2]);
function field(o){o.x=o.x+1;}
function update(o){o.x++;}
function integer(n){var s=0;for(var i=0;i<n;i++)s+=i;return s;}
function bits(b){var m=1,c=0;while(m<256){if(b&m)c++;m<<=1;}return c;}
function Make(v){this.a=v;this.b=2;this.c=3;this.d=4;this.e=5;this.f=6;}
var object={x:0},last=0,ring=new Array(1024);
var start=performance.now();
if(mode==='field')for(var i=0;i<n;i++)field(object);
else if(mode==='update')for(var i=0;i<n;i++)update(object);
else if(mode==='integer')for(var i=0;i<n;i++)last=integer(2000);
else if(mode==='bits')for(var i=0;i<n;i++)last=bits(i&255);
else if(mode==='edge')for(var i=0;i<n;i++)ring[i&1023]=new Make(i);
else throw Error('mode');
var end=performance.now(),expected;
if(mode==='field'||mode==='update'){last=object.x;expected=n;}
else if(mode==='integer')expected=1999000;
else if(mode==='bits')expected=8;
else {last=ring[(n-1)&1023].a;expected=n-1;}
if(last!==expected)throw Error('checksum '+last+' != '+expected);
print('EXECUTION_MICRO:'+JSON.stringify({mode:mode,N:n,result:last,correctness:'PASS',elapsed_ms:end-start,start_ms:start,stop_ms:end,warmup_calls:0}));
}
run();
