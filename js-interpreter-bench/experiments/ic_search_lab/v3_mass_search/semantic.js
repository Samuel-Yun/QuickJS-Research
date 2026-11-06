(function () {
  var checks = 0;
  function eq(a, b) { checks++; if (a !== b) throw Error('mass check ' + checks + ': ' + a + '/' + b); }
  function read(o) { return o.x; }
  function method(o) { return o.step(3); }
  for (var count = 1; count <= 17; count++) {
    var objects = [];
    for (var k = 0; k < count; k++) {
      var o = {};
      for (var j = 0; j < k; j++) o['prefix' + j] = j;
      o.x = k + 1; objects.push(o);
    }
    for (var i = 0; i < 512; i++) eq(read(objects[i % count]), i % count + 1);
    objects[0].x = 99; eq(read(objects[0]), 99);
    objects[0].extra = true; eq(read(objects[0]), 99);
    delete objects[0].x; eq(read(objects[0]), undefined);
    objects[0].x = 101; eq(read(objects[0]), 101);
  }
  var obj = {x: 1, bias: 7, step: function (n) { return this.bias + n; }};
  eq(method(obj), 10);
  Object.defineProperty(obj, 'x', {configurable: true, get: function () { return this.bias + 10; }});
  eq(read(obj), 17);
  Object.defineProperty(obj, 'x', {configurable: true, value: 23, writable: false}); eq(read(obj), 23);
  var parent = {x: 29, bias: 31, step: obj.step}; var child = Object.create(parent);
  eq(read(child), 29); eq(method(child), 34); parent.x = 37; eq(read(child), 37);
  child.x = 41; eq(read(child), 41); delete child.x; eq(read(child), 37);
  Object.setPrototypeOf(child, {x: 43}); eq(read(child), 43);
  var calls = 0;
  var proxy = new Proxy({x: 47}, {get: function (t, key, receiver) { calls++; return Reflect.get(t, key, receiver); }});
  eq(read(proxy), 47); eq(read(proxy), 47); eq(calls, 2);
  var thrown = false; try { read(null); } catch (e) { thrown = e instanceof TypeError; } eq(thrown, true);
  var gone = {x: 53}; for (i = 0; i < 128; i++) { gone['a' + i] = i; eq(read(gone), 53); delete gone['a' + i]; }
  for (i = 0; i < 100; i++) { var value = {x: {value: i}}; eq(read(value).value, i); }
  console.log('MASS_SEMANTIC_PASS:' + checks);
})();
