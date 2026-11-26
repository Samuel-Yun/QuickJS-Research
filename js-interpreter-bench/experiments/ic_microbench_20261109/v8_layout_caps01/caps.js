var a=Object.create({}); a.x=3; a.pad=0;
var b=Object.create({}); b.pad=0; b.x=3;
var c={x:3,pad:0}; Object.setPrototypeOf(c,{});
var d={pad:0,x:3}; Object.setPrototypeOf(d,{});
print(JSON.stringify({create_a_fast:%HasFastProperties(a),create_b_fast:%HasFastProperties(b),
set_proto_c_fast:%HasFastProperties(c),set_proto_d_fast:%HasFastProperties(d),
a_b_same:%HaveSameMap(a,b),c_d_same:%HaveSameMap(c,d)}));
