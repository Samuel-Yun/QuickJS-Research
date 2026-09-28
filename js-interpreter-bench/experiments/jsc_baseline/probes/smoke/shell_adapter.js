// Loaded before existing workloads; never inserted into their timed region.
globalThis.console = {
    log: function () { print(Array.prototype.join.call(arguments, ' ')); }
};
