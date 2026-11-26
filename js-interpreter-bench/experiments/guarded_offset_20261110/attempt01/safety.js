'use strict';
let assertions = 0;
function eq(actual, expected, label) {
    assertions++;
    if (!Object.is(actual, expected))
        throw Error(label + ': ' + String(actual) + ' != ' + String(expected));
}
function read(o) { return o.offsetProbe; }
function warm(o, expected) { for (let i = 0; i < 12; ++i) eq(read(o), expected, 'warm'); }
function sqrt(o) { return o.sqrt(9); }
function sqrtValue(o) { return o.sqrt; }
function increment(o) { o.offsetProbe += 1; return o.offsetProbe; }
function method(o) { return o.offsetProbe(); }

const oldSqrt = Object.getOwnPropertyDescriptor(Math, 'sqrt');
const oldProto = Object.getPrototypeOf(Math);
const added = [];
try {
    // Built-in autoinit -> ordinary value -> checked hint, including fused arg0.
    for (let i = 0; i < 20; ++i) eq(sqrt(Math), 3, 'native method');
    const originalSqrt = sqrtValue(Math);
    for (let i = 0; i < 12; ++i) eq(sqrtValue(Math), originalSqrt, 'method value');
    Math.sqrt = function (x) { return x + 100; };
    eq(sqrt(Math), 109, 'replacement method');
    let getterCalls = 0;
    Object.defineProperty(Math, 'sqrt', {
        configurable: true, get() { getterCalls++; return originalSqrt; }
    });
    eq(sqrt(Math), 3, 'method getter');
    eq(getterCalls, 1, 'getter executes once');
    Object.defineProperty(Math, 'sqrt', oldSqrt);

    Math.offsetProbe = 10;
    warm(Math, 10);
    Math.offsetProbe = 11;
    eq(read(Math), 11, 'current value');
    eq(increment(Math), 12, 'shared store first');
    for (let i = 0; i < 20; ++i) eq(increment(Math), 13 + i, 'shared store');

    // Grow/reallocate shape/property arrays while hint is live.
    for (let i = 0; i < 1200; ++i) {
        const key = '__offset_growth_' + i;
        added.push(key);
        Math[key] = i;
    }
    eq(read(Math), 32, 'growth');
    for (let i = 0; i < 1100; ++i) delete Math[added[i]];
    Math.__offset_after_deletes = 1;
    added.push('__offset_after_deletes');
    eq(read(Math), 32, 'deletion and possible compaction');

    delete Math.offsetProbe;
    eq(read(Math), undefined, 'deleted property');
    const prototype = { offsetProbe: 41 };
    Object.setPrototypeOf(Math, prototype);
    eq(read(Math), 41, 'inherited after deletion');
    Math.offsetProbe = 42;
    warm(Math, 42);
    Object.defineProperty(Math, 'offsetProbe', {
        configurable: true, get() { getterCalls++; return this === Math ? 43 : -1; }
    });
    eq(read(Math), 43, 'data converted to getter');
    eq(getterCalls, 2, 'second getter executes once');
    const sentinel = new Error('offset getter exception');
    Object.defineProperty(Math, 'offsetProbe', {
        configurable: true, get() { throw sentinel; }
    });
    let caught;
    try { read(Math); } catch (error) { caught = error; }
    eq(caught, sentinel, 'getter exception');
    Object.defineProperty(Math, 'offsetProbe', { configurable: true, writable: true, value: 50 });
    warm(Math, 50);

    // Same read site crosses ordinary hashed shapes, primitives and exotic proxy.
    const ordinary = { a: 1, b: 2, offsetProbe: 60 };
    warm(ordinary, 60);
    warm(Math, 50);
    let proxyCalls = 0;
    const proxy = new Proxy({}, { get(target, key, receiver) {
        proxyCalls++; return key === 'offsetProbe' ? 70 : Reflect.get(target, key, receiver);
    }});
    eq(read(proxy), 70, 'proxy fallback');
    eq(proxyCalls, 1, 'proxy trap once');
    eq(read('hello'), undefined, 'primitive fallback');
    eq(read([1, 2]), undefined, 'array fallback');
    warm(Math, 50);

    Math.offsetProbe = function () { return this === Math ? 80 : -1; };
    for (let i = 0; i < 20; ++i) eq(method(Math), 80, 'method this preserved');
    for (let i = 0; i < 20; ++i) eq(eval('(function(o){return o.offsetProbe();})(Math)'), 80, 'eval cold');
    // Read-only flags still permit reads and shared writes must reject.
    Object.defineProperty(Math, 'offsetProbe', { configurable: true, writable: false, value: 90 });
    warm(Math, 90);
    let readonlyThrown = false;
    try { increment(Math); } catch (error) { readonlyThrown = error instanceof TypeError; }
    eq(readonlyThrown, true, 'read-only write');
    eq(read(Math), 90, 'read-only unchanged');
} finally {
    delete Math.offsetProbe;
    for (const key of added) delete Math[key];
    Object.setPrototypeOf(Math, oldProto);
    Object.defineProperty(Math, 'sqrt', oldSqrt);
}
print('SAFETY_PASS ' + assertions);
