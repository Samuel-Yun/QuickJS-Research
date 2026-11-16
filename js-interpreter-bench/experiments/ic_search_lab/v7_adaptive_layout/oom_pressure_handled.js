// Revised diagnostic only: upstream JS_ThrowError2 may throw null on OOM.
// Inspect a saved exception only after dropping pressure and collecting garbage.
function readPressure(o) { return o.x; }
function storePressure(o, v) { o.x = v; }
var keptPressure = [], sawPressureOOM = false, savedPressureError;
try {
  for (var pressureI = 0; pressureI < 50000; pressureI++) {
    var pressureObject = {};
    for (var pressureJ = 0; pressureJ < pressureI % 8; pressureJ++)
      pressureObject['prefix' + pressureJ] = pressureJ;
    storePressure(pressureObject, pressureI);
    for (var pressureK = 0; pressureK < 10; pressureK++)
      if (readPressure(pressureObject) !== pressureI) throw Error('bad value');
    for (var pressureJ = 0; pressureJ < 24; pressureJ++)
      pressureObject['extra' + pressureJ] = pressureJ;
    if (readPressure(pressureObject) !== pressureI) throw Error('bad spill');
    keptPressure.push(pressureObject);
  }
} catch (pressureError) {
  savedPressureError = pressureError;
  sawPressureOOM = true;
}
keptPressure = null;
pressureObject = null;
std.gc();
if (!sawPressureOOM) throw Error('OOM not reached');
if (savedPressureError !== null &&
    (savedPressureError.name !== 'InternalError' || savedPressureError.message !== 'out of memory'))
  throw savedPressureError;
savedPressureError = null;
std.gc();
for (var pressureI = 0; pressureI < 80; pressureI++) {
  var recoveredPressure = {x: pressureI};
  if (readPressure(recoveredPressure) !== pressureI) throw Error('recovery');
  storePressure(recoveredPressure, pressureI + 1);
  if (readPressure(recoveredPressure) !== pressureI + 1) throw Error('recovery write');
}
print('V7_OOM_PRESSURE_PASS');
