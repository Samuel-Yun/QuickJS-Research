// The addition after the field read also checks that pc skips all 5 bytes.
function readX(o) { return o.x + 1; }
function readLocal(o) { var p = o; return p.x + 1; }
var out = [], calls = 0;
var a = {x: 3, a: 0}, b = {x: 8, b: 0};
out.push(readX(a), readX(a), readX(b), readX(a));
a.x = 11; out.push(readX(a));
var getter = {get x() { calls++; return 20; }};
out.push(readX(getter));
out.push(readX(new Proxy({x: 30}, {get: function(t,k,r) {
    calls++; return Reflect.get(t,k,r);
}})));
out.push(readX(Object.create({x: 40})));
out.push(readX('abc'));
try { readX(null); } catch (e) { out.push(e.name); }
var throwing = {get x() { calls++; throw Error('getter'); }};
try { readX(throwing); } catch (e) { out.push(e.message); }
Object.defineProperty(a, 'x', {get: function() { calls++; return 50; }});
out.push(readX(a));
delete b.x; out.push(readX(b));
out.push(readLocal({x: 60}), readLocal({x: 70, z: 0}));
out.push(calls);
print(JSON.stringify(out));
