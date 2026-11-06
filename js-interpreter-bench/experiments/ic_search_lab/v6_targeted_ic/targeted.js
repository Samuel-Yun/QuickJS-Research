(function () {
  function check(ok) { if (!ok) throw Error('v6 targeted check'); }
  function get(o) { return o.x; }
  var a = {x: 1}, b = {extra: 2, x: 3};
  for (var i = 0; i < 32; ++i) check(get(a) === 1 && get(b) === 3);
  a.x = 91; check(get(a) === 91);
  Object.defineProperty(a, 'x', {get: function () { return 7; }, configurable: true});
  check(get(a) === 7); delete a.x;
  Object.setPrototypeOf(a, {x: 11}); check(get(a) === 11);
  function write(o, v) { o.x = v; return o.x; }
  var w = {x: 0}; for (i = 0; i < 32; i++) check(write(w, i) === i);
  Object.defineProperty(w, 'x', {value: 4, writable: false, configurable: true});
  check(write(w, 100) === 4);
  var seen = 0, h = {get x() { return seen; }, set x(v) { seen = v + 1; }};
  check(write(h, 2) === 3);
  function method(o) { return o.step(); }
  var proto = {step: function () { return this.bias; }}, o = Object.create(proto); o.bias = 3;
  for (i = 0; i < 32; i++) check(method(o) === 3);
  proto.step = function () { return this.bias + 1; }; check(method(o) === 4);
  o.step = function () { return 8; }; check(method(o) === 8);
  delete o.step; check(method(o) === 4);
  Object.defineProperty(proto, 'step', {get: function () { return function () { return 9; }; }, configurable: true});
  check(method(o) === 9);
  function recursive(n) { return n ? get({x: recursive(n - 1)}) + 1 : 0; }
  check(recursive(16) === 16);
  function* gen(o) { yield o.x; o.x++; yield o.x; }
  var g = gen({x: 4}); check(g.next().value === 4 && g.next().value === 5);
  function join(flag, first) { var second = first; return (flag ? first : second).x; }
  for (i = 0; i < 32; i++) check(join(i & 1, b) === 3);
  try { (function () {'use strict'; w.x = 7; })(); check(false); } catch (e) { check(e instanceof TypeError); }
  print('V6_TARGETED_PASS');
})();
