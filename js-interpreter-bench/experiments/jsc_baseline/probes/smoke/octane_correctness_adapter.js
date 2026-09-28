// Outside the unchanged Octane strict generated workload and timed region.
globalThis.console = {
    log: function () { print(Array.prototype.join.call(arguments, ' ')); }
};
globalThis.scriptArgs = [
    'STRICT_CONFIG=' + JSON.stringify({ N: 1, mode: 'correctness', timer: 'Date.now' })
];
