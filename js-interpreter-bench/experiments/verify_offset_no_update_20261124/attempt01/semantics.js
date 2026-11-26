var out=[];
function check(label,fn) {
    try { out.push([label,fn()]); }
    catch(e) {out.push([label,e.name,e.message]);}
}
// Every pair uses one static read point, after first filling its cache.
function sequence(a,b) {
    function readX(o) {return o.x;}
    var values=[];
    for(var i=0;i<8;i++)values.push(readX(i&1?b:a));
    return values;
}
check('stable',function(){return sequence({x:3,a:0},{x:3,a:0});});
check('same_slot_current_value',function(){return sequence({x:3,a:0},{x:5,b:0});});
check('different_slot_no_99',function(){return sequence({x:3,a:0},{pad:99,x:5});});
check('old_slot_reused',function(){var b={x:5,a:0};delete b.x;b.pad=99;return sequence({x:3,a:0},b);});
check('deleted',function(){var b={x:5,b:0};delete b.x;return sequence({x:3,a:0},b);});
check('getter_this',function(){var b={v:8};Object.defineProperty(b,'x',{get:function(){return this.v;}});return sequence({x:3,a:0},b);});
check('prototype',function(){var b=Object.create({x:11});b.pad=99;return sequence({x:3,a:0},b);});
check('getter_throw',function(){var b={};Object.defineProperty(b,'x',{get:function(){throw TypeError('getter');}});return sequence({x:3,a:0},b);});
check('proxy',function(){var b=new Proxy({x:13},{get:function(t,k,r){return Reflect.get(t,k,r);}});return sequence({x:3,a:0},b);});
check('mutate_hot',function(){
    function readX(o){return o.x;}
    var a={x:3,a:0},values=[];
    for(var i=0;i<4;i++)values.push(readX(a));
    a.x=6;values.push(readX(a));delete a.x;values.push(readX(a));
    a.pad=99;a.x=8;values.push(readX(a));
    Object.defineProperty(a,'x',{get:function(){return 17;},configurable:true});values.push(readX(a));
    delete a.x;Object.setPrototypeOf(a,{x:19});values.push(readX(a));
    return values;
});
check('null',function(){return sequence({x:3,a:0},null);});
print(JSON.stringify(out));
