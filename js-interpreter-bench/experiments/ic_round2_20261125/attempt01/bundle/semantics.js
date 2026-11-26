let checks = 0;
function check(actual, expected) {
    if (actual !== expected) throw new Error("check " + (checks + 1));
    checks++;
}
function test(x, rhs) { return x instanceof rhs; }
function Pair() {}
const old = new Pair(), prev = Pair.prototype;
for (let i = 0; i < 100; ++i) {
    check(test(old, Pair), true);
    check(test(i, Pair), false);
}
Pair.prototype = {};
check(test(old, Pair), false);
check(test(new Pair(), Pair), true);
Pair.prototype = 23;
check(test(5, Pair), false);
let threw = false;
try { test(old, Pair); } catch (err) { threw = err instanceof TypeError; }
check(threw, true);
Pair.prototype = prev;
let gets = 0, calls = 0;
Object.defineProperty(Pair, Symbol.hasInstance, {
    configurable: true,
    get() { gets++; return function(x) { calls++; return x === 7; }; }
});
check(test(7, Pair), true);
check(test(old, Pair), false);
check(gets, 2); check(calls, 2);
delete Pair[Symbol.hasInstance];
check(test(old, Pair), true);
const deep = Object.create(Object.create(prev));
check(test(deep, Pair), true);
let traps = 0;
const proxied = new Proxy({}, {getPrototypeOf() { traps++; return prev; }});
check(test(proxied, Pair), true); check(traps, 1);
const bound = Pair.bind(null);
check(test(old, bound), true);
const anonymous = () => 42;
check(test(2, anonymous), false);
let observed = 0;
const wrapper = new Proxy(Pair, {get(t, k, r) { if(k === Symbol.hasInstance) observed++; return Reflect.get(t,k,r); }});
check(test(old, wrapper), true); check(observed, 1);
console.log("PASS " + checks);
