'use strict';
__b3_begin();
var assertions=0;
function eq(a,b,label){assertions++;if(!Object.is(a,b))throw Error(label+': '+String(a)+' != '+String(b));}
function call(re,s){return re.exec(s);}
function warm(re,s,expected){for(var i=0;i<12;i++)eq(call(re,s),expected,'warm');}

// Do not read the native method first: the first call exercises AUTOINIT.
var re=/a/g;
for(var i=0;i<12;i++){re.lastIndex=0;eq(call(re,'a')[0],'a','native method / this');}
var proto=Object.getPrototypeOf(re),nativeExec=proto.exec,original=Object.getOwnPropertyDescriptor(proto,'exec');
var expected=re,invocations=0;
try {
    // Same data descriptor/slot, different value: a hit must load the new value.
    proto.exec=function(s){invocations++;eq(this,expected,'replacement this');return s+invocations;};
    eq(call(re,'v'), 'v1','replacement current value');
    eq(call(re,'v'), 'v2','no result cache');
    var sameShape=/b/;expected=sameShape;
    eq(call(sameShape,'v'),'v3','same shape different receiver');
    expected=re;
    // Non-callable DATA value remains a property hit; the ordinary call throws.
    proto.exec=7;var threw=false;
    try{call(re,'a');}catch(e){threw=e instanceof TypeError;}eq(threw,true,'noncallable still throws');
    proto.exec=function(s){eq(this,expected,'restored this');return 'proto:'+s;};
    warm(re,'x','proto:x');

    // Receiver own shadow, including a getter. Never use the cached prototype.
    re.exec=function(s){eq(this,re,'own this');return 'own:'+s;};
    eq(call(re,'x'),'own:x','own shadows prototype');
    delete re.exec;eq(call(re,'x'),'proto:x','delete own shadow');
    var fresh=/c/;expected=fresh;warm(fresh,'x','proto:x');
    var ownGets=0;
    Object.defineProperty(fresh,'exec',{configurable:true,get:function(){ownGets++;eq(this,fresh,'own getter this');return function(s){eq(this,fresh,'own returned this');return 'getter:'+s;};}});
    eq(call(fresh,'x'),'getter:x','own getter');eq(ownGets,1,'own getter exactly once');

    // Cache first, then change descriptor to getter, then back to data.
    fresh=/d/;expected=fresh;warm(fresh,'x','proto:x');
    var protoGets=0;
    Object.defineProperty(proto,'exec',{configurable:true,enumerable:false,get:function(){protoGets++;eq(this,fresh,'prototype getter receiver');return function(s){eq(this,fresh,'getter method receiver');return 'pg:'+s;};}});
    eq(call(fresh,'x'),'pg:x','prototype getter');eq(protoGets,1,'prototype getter once');
    var sentinel={};
    Object.defineProperty(proto,'exec',{configurable:true,get:function(){throw sentinel;}});
    var caught;try{call(fresh,'x');}catch(e){caught=e;}eq(caught,sentinel,'getter exception identity');
    Object.defineProperty(proto,'exec',{configurable:true,writable:true,enumerable:false,value:function(s){eq(this,expected,'data again this');return 'data:'+s;}});
    fresh=/e/;expected=fresh;warm(fresh,'x','data:x');

    // Prototype replacement invalidates receiver layout, even at the same site.
    var alternate={exec:function(s){eq(this,fresh,'alternate this');return 'alternate:'+s;}};
    Object.setPrototypeOf(fresh,alternate);eq(call(fresh,'x'),'alternate:x','prototype replaced');
    Object.setPrototypeOf(fresh,proto);eq(call(fresh,'x'),'data:x','prototype restored');

    // Proxy receiver must stay the receiver; it is not silently unwrapped.
    var target=/p/,proxyGets=0,proxy;
    target.exec=function(s){eq(this,proxy,'proxy this preserved');return 'proxy:'+s;};
    proxy=new Proxy(target,{get:function(t,k,r){if(k==='exec')proxyGets++;return Reflect.get(t,k,r);}});
    eq(call(proxy,'x'),'proxy:x','proxy receiver');eq(proxyGets,1,'proxy get once');
    // Native RegExp.exec with Proxy this must keep the original brand failure.
    var nativeProxy=new Proxy(/a/,{});
    Object.defineProperty(proto,'exec',original);threw=false;
    try{call(nativeProxy,'a');}catch(e){threw=e instanceof TypeError;}eq(threw,true,'proxy native brand check');

    // Proxy in direct prototype: getter/trap runs with the original receiver.
    fresh=/q/;var holderGets=0;
    var holderProxy=new Proxy({exec:function(s){eq(this,fresh,'proxy holder this');return 'hp:'+s;}},
        {get:function(t,k,r){if(k==='exec')holderGets++;return Reflect.get(t,k,r);}});
    Object.setPrototypeOf(fresh,holderProxy);eq(call(fresh,'x'),'hp:x','proxy holder');eq(holderGets,1,'holder trap once');

    // Materializing another lazy prototype method must invalidate safely.
    fresh=/a/;for(var i=0;i<12;i++)eq(call(fresh,'a')[0],'a','native warm again');
    eq(fresh.test('a'),true,'other AUTOINIT method');
    eq(call(fresh,'a')[0],'a','exec after another AUTOINIT');
    eq(typeof Object.getOwnPropertyDescriptor(proto,'test').value,'function','materialized method');

    // A name other than exec: optimization is class/descriptor based.
    proto.ping=function(s){eq(this,expected,'arbitrary-name this');return 'ping:'+s;};
    function ping(o,s){return o.ping(s);}
    fresh=/r/;expected=fresh;
    for(var i=0;i<12;i++)eq(ping(fresh,'x'),'ping:x','arbitrary data method');

    // Delete the target and allow a deeper prototype to supply it. Do this
    // last: deleted private layouts deliberately need not be re-admitted.
    expected=fresh;proto.exec=function(s){return 'last:'+s;};warm(fresh,'x','last:x');
    var objectProto=Object.getPrototypeOf(proto),oldDeep=Object.getOwnPropertyDescriptor(objectProto,'exec');
    try{
        Object.defineProperty(objectProto,'exec',{configurable:true,writable:true,value:function(s){eq(this,fresh,'deep this');return 'deep:'+s;}});
        delete proto.exec;eq(call(fresh,'x'),'deep:x','deleted target finds deeper property');
        delete objectProto.exec;threw=false;
        try{call(fresh,'x');}catch(e){threw=e instanceof TypeError;}eq(threw,true,'missing method');
        Object.defineProperty(proto,'exec',original);eq(call(fresh,'r')[0],'r','redefined after delete');
    }finally{if(oldDeep)Object.defineProperty(objectProto,'exec',oldDeep);else delete objectProto.exec;}
}finally{
    Object.defineProperty(proto,'exec',original);delete proto.ping;
}
print('B3_SAFETY_PASS '+assertions);

__b3_end();
