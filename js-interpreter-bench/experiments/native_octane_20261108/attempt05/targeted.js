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
