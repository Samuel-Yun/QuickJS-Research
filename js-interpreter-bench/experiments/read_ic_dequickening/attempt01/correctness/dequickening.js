var dqAssertions=0,dqScenarios=0;
function dqEq(a,b){dqAssertions++;if(a!==b)throw Error('dequick assertion '+dqAssertions+': '+a+' != '+b);}
function dqRead(o){return o.x;}
// 1: stable integers, references, same shape different objects, current values.
dqScenarios++;var dqA={x:1,t:0},dqB={x:2,t:0};
for(var dqI=0;dqI<100;dqI++){dqA.x=dqI;dqEq(dqRead(dqA),dqI);dqEq(dqRead(dqB),2);}
dqScenarios++;var dqAnchor={},dqBox={x:dqAnchor};for(dqI=0;dqI<100;dqI++){dqEq(dqRead(dqBox),dqAnchor);dqBox.x=dqAnchor={};}
// 3: disjoint final sites of the same atom; the stable site must remain active.
function dqTwo(a,b){return a.x+b.x;}
dqScenarios++;var dqPolys=[{x:1,z:0},{z:0,x:2}];for(dqI=0;dqI<100;dqI++)dqEq(dqTwo(dqB,dqPolys[dqI%2]),3+dqI%2);
// 4--6: exact boundaries and a hit in between consecutive-miss runs.
function dq31(o){return o.x;}function dq32(o){return o.x;}function dq33(o){return o.x;}
var dqProto=Object.create({x:7});dqScenarios++;for(dqI=0;dqI<31;dqI++)dqEq(dq31(dqProto),7);
dqScenarios++;for(dqI=0;dqI<32;dqI++)dqEq(dq32(dqProto),7);
dqScenarios++;for(dqI=0;dqI<33;dqI++)dqEq(dq33(dqProto),7);
function dqReset(o){return o.x;}
dqScenarios++;dqEq(dqReset(dqA),99);dqEq(dqReset(dqA),99);
for(dqI=0;dqI<31;dqI++)dqEq(dqReset(dqProto),7);dqEq(dqReset(dqA),99);
for(dqI=0;dqI<32;dqI++)dqEq(dqReset(dqProto),7);for(dqI=0;dqI<10;dqI++)dqEq(dqReset(dqA),99);
// 8--11: inherited, missing, primitive and special receivers keep normal semantics.
function dqInherited(o){return o.x;}function dqMissing(o){return o.zzAbsent;}
dqScenarios++;for(dqI=0;dqI<64;dqI++)dqEq(dqInherited(dqProto),7);
dqScenarios++;for(dqI=0;dqI<64;dqI++)dqEq(dqMissing({y:1}),undefined);
function dqPrimitive(o){return o.x;}dqScenarios++;for(dqI=0;dqI<64;dqI++)dqEq(dqPrimitive(3),undefined);
function dqSpecial(o){return o.x;}dqScenarios++;var dqArr=[];dqArr.x=11;for(dqI=0;dqI<64;dqI++)dqEq(dqSpecial(dqArr),11);
// 12--14: accessor/Proxy and exceptions happen exactly once, including miss #32.
function dqGetter(o){return o.x;}dqScenarios++;var dqGets=0,dqObj={get x(){dqGets++;return dqGets;}};
for(dqI=1;dqI<=64;dqI++)dqEq(dqGetter(dqObj),dqI);dqEq(dqGets,64);
function dqProxy(o){return o.x;}dqScenarios++;var dqTraps=0,dqP=new Proxy({x:9},{get:function(t,k,r){dqTraps++;return Reflect.get(t,k,r);}});
for(dqI=0;dqI<64;dqI++)dqEq(dqProxy(dqP),9);dqEq(dqTraps,64);
function dqThrow(o){return o.x;}dqScenarios++;var dqThrows=0,dqT={get x(){dqThrows++;throw Error('dqThrow');}};
for(dqI=0;dqI<64;dqI++){try{dqThrow(dqT);dqEq(true,false);}catch(e){dqEq(e.message,'dqThrow');}}dqEq(dqThrows,64);
// 15: deletes/redefinitions/prototype changes after an exit do not become cached failures.
function dqMutate(o){return o.x;}dqScenarios++;var dqChange=Object.create({x:1});for(dqI=0;dqI<40;dqI++)dqEq(dqMutate(dqChange),1);
dqChange.x=2;dqEq(dqMutate(dqChange),2);delete dqChange.x;dqEq(dqMutate(dqChange),1);
Object.setPrototypeOf(dqChange,{x:3});dqEq(dqMutate(dqChange),3);
Object.defineProperty(dqChange,'x',{get:function(){return 4;},configurable:true});dqEq(dqMutate(dqChange),4);
Object.defineProperty(dqChange,'x',{value:5,writable:true,configurable:true});dqChange.x=6;dqEq(dqMutate(dqChange),6);
// 16: get_field2 receiver and a getter that returns the method.
function dqMethod(o,x){return o.step(x);}dqScenarios++;var dqMethodGets=0,dqReceiver={bias:3,get step(){dqMethodGets++;return function(x){dqEq(this,dqReceiver);return this.bias+x;};}};
for(dqI=0;dqI<64;dqI++)dqEq(dqMethod(dqReceiver,dqI),dqI+3);dqEq(dqMethodGets,64);
// 17: recursive getter re-enters one compiled bytecode and one read site while exiting.
function dqRecursive(o){return o.x;}dqScenarios++;var dqDepth=0,dqRecGets=0,dqRec={get x(){dqRecGets++;if(dqDepth===40)return 0;dqDepth++;try{return dqRecursive(dqRec)+1;}finally{dqDepth--;}}};
dqEq(dqRecursive(dqRec),40);dqEq(dqRecGets,41);dqEq(dqRecursive(dqRec),40);dqEq(dqRecGets,82);
// 18: recursive method getter, with active frames and correct this after exit.
function dqRecursiveMethod(o,n){return o.step(n);}dqScenarios++;var dqMD=0,dqMG=0,dqMC=0,dqMR={get step(){dqMG++;if(dqMD<40){dqMD++;try{dqRecursiveMethod(dqMR,0);}finally{dqMD--;}}return dqMF;}};
function dqMF(n){dqEq(this,dqMR);dqMC++;return n+3;}
dqEq(dqRecursiveMethod(dqMR,2),5);dqEq(dqMG,41);dqEq(dqMC,41);
// 19: closures from the same factory share the compiled bytecode's exit state.
function dqFactory(){return function dqShared(o){return o.x;};}dqScenarios++;var dqF1=dqFactory(),dqF2=dqFactory();
for(dqI=0;dqI<32;dqI++)dqEq(dqF1(dqProto),7);for(dqI=0;dqI<64;dqI++)dqEq(dqF2(dqA),99);
// 20/21: irrevocable exit loses a later stable phase; correctness remains unchanged.
function dqPhase(o){return o.x;}dqScenarios++;for(dqI=0;dqI<40;dqI++)dqEq(dqPhase(dqProto),7);for(dqI=0;dqI<128;dqI++)dqEq(dqPhase(dqA),99);
function dqPhaseHit(o){return o.x;}dqScenarios++;for(dqI=0;dqI<8;dqI++)dqEq(dqPhaseHit(dqA),99);for(dqI=0;dqI<40;dqI++)dqEq(dqPhaseHit(dqProto),7);for(dqI=0;dqI<128;dqI++)dqEq(dqPhaseHit(dqA),99);
// 22: null and Proxy throws follow the same state machine and side effects.
function dqNull(o){return o.x;}dqScenarios++;for(dqI=0;dqI<64;dqI++){try{dqNull(null);dqEq(true,false);}catch(e){dqEq(e instanceof TypeError,true);}}
function dqProxyThrow(o){return o.x;}dqScenarios++;var dqPT=0,dqPTarget=new Proxy({},{get:function(){dqPT++;throw Error('proxyThrow');}});
for(dqI=0;dqI<64;dqI++){try{dqProxyThrow(dqPTarget);dqEq(true,false);}catch(e){dqEq(e.message,'proxyThrow');}}dqEq(dqPT,64);
console.log('DEQUICKEN_PASS scenarios='+dqScenarios+' assertions='+dqAssertions);
