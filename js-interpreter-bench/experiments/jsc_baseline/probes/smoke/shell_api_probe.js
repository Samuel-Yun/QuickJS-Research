var names = ['print', 'load', 'read', 'readFile', 'quit', 'arguments', 'gc', 'performance', 'console'];
for (var i = 0; i < names.length; ++i) {
    var name = names[i];
    print(name + ':' + typeof globalThis[name]);
}
print('performance.now:' +
    (typeof performance === 'object' ? typeof performance.now : 'UNAVAILABLE'));
print('Date.now:' + typeof Date.now);
