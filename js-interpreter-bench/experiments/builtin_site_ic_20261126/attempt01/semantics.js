if(typeof __ep_begin==='function')__ep_begin();
var out=[];function push(v){out.push(Number.isNaN(v)?'NaN':v);}
function read(s,i){var x=s.charCodeAt(i);return x;}
var text='a\u03b1\ud83d\ude00z';
for(var n=0;n<30;n++)push(read(text,n%5));
var native=String.prototype.charCodeAt;
String.prototype.charCodeAt=function(i){return 1000+i;};push(read(text,2));String.prototype.charCodeAt=native;push(read(text,2));
// The method has already been read when the argument expression runs.
var changed=0;function changeMethod(){changed++;String.prototype.charCodeAt=function(){return 999;};return 1;}
function readChanged(s,flag){var x=s.charCodeAt(flag?changeMethod():1);return x;}
for(var n=0;n<12;n++)push(readChanged(text,false));push(readChanged(text,true));push(readChanged(text,false));String.prototype.charCodeAt=native;
push(changed);push(read(text,2));push(read(text,3));push(read(text,-1));push(read(text,99));push(read(text,1.7));push(read(text,-0));push(read(text,NaN));
var converted=0;push(read(text,{valueOf:function(){converted++;return 1;}}));push(converted);
var receiver={charCodeAt:native,toString:function(){converted++;return text;}};push(read(receiver,1));push(converted);
try{read(text,Symbol('index'));}catch(e){push(e.name);}
try{read(null,0);}catch(e){push(e.name);}
// No IC installation for these indirect/forwarded calls.
var bound=native.bind(text);function indirect(i){var f=native;var x=f.call(text,i);return x;}
for(var n=0;n<15;n++){push(indirect(1));push(bound(2));push(native.apply(text,[3]));}
// Eight consecutive failed IC guards deopt, and do not repeat conversions.
function deopt(s,i){var x=s.charCodeAt(i);return x;}
for(var n=0;n<10;n++)push(deopt(text,1));
for(var n=0;n<12;n++)push(deopt(text,{valueOf:function(){converted++;return 3;}}));
for(var n=0;n<10;n++)push(deopt(text,0));push(converted);
// Tail method calls are intentionally not V1 sites.
function tail(s,i){return s.charCodeAt(i);}for(var n=0;n<20;n++)push(tail(text,1));
print(JSON.stringify(out));if(typeof __ep_end==='function')__ep_end();
// A getter still runs once per method read, including after action installation.
var methodGets=0;Object.defineProperty(String.prototype,'charCodeAt',{get:function(){methodGets++;return native;},configurable:true});
function getterRead(s,i){var x=s.charCodeAt(i);return x;}var extra=[];for(var n=0;n<30;n++)extra.push(getterRead('abc',1));extra.push(methodGets);
Object.defineProperty(String.prototype,'charCodeAt',{value:native,writable:true,configurable:true});
var boundHolder={method:native.bind('XYZ')};function boundMethod(i){var x=boundHolder.method(i);return x;}for(var n=0;n<20;n++)extra.push(boundMethod(1));
var secondArgs=0;function argc2(s){var x=s.charCodeAt(1,secondArgs++);return x;}for(var n=0;n<20;n++)extra.push(argc2('abc'));extra.push(secondArgs);print(JSON.stringify(extra));
