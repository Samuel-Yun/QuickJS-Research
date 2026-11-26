(function () {
  var count = 0;
  function eq(a, b) { count++; if (a !== b) throw Error('S002 check ' + count + ': ' + a + '/' + b); }
  function read(o, k) { return o[k]; }
  function write(o, k, v) { o[k] = v; return o[k]; }
  for (var n = 0; n <= 4; n++) {
    var obj = {};
    for (var i = 0; i < n; i++) obj['f' + i] = i + 11;
    for (i = 0; i < n; i++) eq(read(obj, 'f' + i), i + 11);
    eq(read(obj, 'missing'), undefined);
    eq(Object.hasOwn(obj, 'missing'), false);
    eq(write(obj, 'extra', 41), 41);
    delete obj.extra; eq(read(obj, 'extra'), undefined);
  }
  var x = {a: 1, b: 2};
  delete x.a; eq(x.b, 2); x.a = 3; eq(x.a, 3);
  delete x.b; eq(x.a, 3); x.b = 4; eq(x.b, 4);
  var calls = 0, o = {};
  Object.defineProperty(o, 'x', {configurable: true, get: function () { calls++; return this.y + 1; },
    set: function (v) { calls++; this.y = v - 1; }});
  o.y = 12; eq(o.x, 13); o.x = 19; eq(o.y, 18); eq(calls, 2);
  eq(Object.getOwnPropertyDescriptor(o, 'x').enumerable, false);
  Object.defineProperty(o, 'x', {value: 23, writable: false, configurable: true});
  eq(o.x, 23); eq(write(o, 'x', 24), 23);
  var failed = false;
  try { (function () { 'use strict'; o.x = 31; })(); } catch (e) { failed = e instanceof TypeError; }
  eq(failed, true);
  var parent = {x: 37}, child = Object.create(parent);
  eq(child.x, 37); child.y = 1; eq(child.x, 37);
  child.x = 41; eq(child.x, 41); delete child.x; eq(child.x, 37);
  Object.setPrototypeOf(child, {x: 43}); eq(child.x, 43);
  var noProto = Object.create(null); noProto.x = 47; eq(noProto.x, 47); eq(noProto.toString, undefined);
  var sym = Symbol('x'), box = {}; box[sym] = 53; box.x = 59;
  eq(box[sym], 53); eq(box.x, 59); eq(Object.hasOwn(box, sym), true);
  var numeric = {0: 61, x: 67}; eq(numeric[0], 61); eq(numeric.x, 67);
  var array = [71]; array.x = 73; eq(array[0], 71); eq(array.x, 73); eq(array.length, 1);
  var proxy = new Proxy({x: 79}, {get: function (target, key, receiver) {
    calls++; return Reflect.get(target, key, receiver);
  }});
  eq(proxy.x, 79); eq(calls, 3);
  var sealed = Object.seal({x: 83}); eq(write(sealed, 'x', 89), 89);
  var frozen = Object.freeze({x: 97}); eq(write(frozen, 'x', 101), 97);
  console.log('S002_TARGETED_PASS:' + count);
})();

(function () {
  var count = 0;
  function eq(a, b) { count++; if (a !== b) throw Error('entry/own2 check ' + count); }
  function read(o) { return o.x; }
  function store(o, v) { o.x; o.x = v; return o.x; }
  function compound(o) { o.x += 1; return o.x; }
  var a = {prefixA: 1, x: 7}, b = {prefixB: 2, x: 11}, c = {x: 13, suffix: 3};
  for (var i = 0; i < 200; i++) {
    eq(read(a), a.x); eq(read(b), b.x); eq(read(c), c.x);
    var target = i & 1 ? a : b;
    eq(store(target, i), i); eq(compound(target), i + 1);
  }
  Object.defineProperty(a, 'x', {value: 17, writable: false, configurable: true});
  eq(store(a, 19), 17);
  var failed = false;
  try { (function () { 'use strict'; a.x += 1; })(); } catch (e) { failed = e instanceof TypeError; }
  eq(failed, true);
  var calls = 0;
  Object.defineProperty(a, 'x', {configurable: true, get: function () { calls++; return 23; },
    set: function (v) { calls++; this.changed = v; }});
  eq(store(a, 29), 23); eq(a.changed, 29); eq(calls, 3);
  function factory(seed) { return function recurse(o, n) { return n ? recurse(o, n - 1) : o.x + seed; }; }
  var f = factory(3), g = factory(5);
  eq(f(c, 40), 16); eq(g(c, 40), 18);
  function *generator(o) { yield o.x; o.x += 1; yield o.x; }
  var it = generator(c); eq(it.next().value, 13); eq(it.next().value, 14); eq(it.next().done, true);
  async function value(o) { await 0; return o.x; }
  value(c).then(function (v) { eq(v, 14); console.log('ENTRY_OWN_ASYNC_PASS'); });
  console.log('ENTRY_OWN_SEMANTICS_PASS:' + count);
})();
