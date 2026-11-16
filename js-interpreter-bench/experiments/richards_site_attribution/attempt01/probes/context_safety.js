/* Diagnostic fixture only, NOT Richards and NOT performance data. */
function saInner(o) { return o.inner; }
var saOuter = {
    get first() { return saInner({inner: 7}); },
    get second() { throw 11; },
    ok: 13
};
function runRichards() {
    var value = saOuter.first;
    try { value += saOuter.second; } catch (e) { value += e; }
    value += saOuter.ok;
    return value;
}
if (runRichards() !== 31) throw Error('context fixture failed');
console.log('CONTEXT_SAFETY PASS');
