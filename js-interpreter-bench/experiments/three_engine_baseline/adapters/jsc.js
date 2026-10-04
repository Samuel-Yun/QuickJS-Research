// Loaded by jsc before the common workload/driver script.
globalThis.console = {
  log: function () {
    var __tebText = [];
    for (var __tebArg = 0; __tebArg < arguments.length; ++__tebArg)
      __tebText.push(String(arguments[__tebArg]));
    print(__tebText.join(' '));
  }
};
globalThis.__TEB_marker = function (message) { printErr(message); };
