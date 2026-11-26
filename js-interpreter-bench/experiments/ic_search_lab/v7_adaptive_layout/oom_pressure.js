// Independent allocation-pressure check, never a performance workload.
// This does not claim to fault every individual IC allocation point.
function readPressure(o) { return o.x; }
function storePressure(o, v) { o.x = v; }
var keptPressure = [], sawPressureOOM = false;
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
  if (pressureError.name !== 'InternalError' || pressureError.message !== 'out of memory')
    throw pressureError;
  sawPressureOOM = true;
}
keptPressure = null;
pressureObject = null;
std.gc();
if (!sawPressureOOM) throw Error('OOM not reached');
for (var pressureI = 0; pressureI < 80; pressureI++) {
  var recoveredPressure = {x: pressureI};
  if (readPressure(recoveredPressure) !== pressureI) throw Error('recovery');
  storePressure(recoveredPressure, pressureI + 1);
  if (readPressure(recoveredPressure) !== pressureI + 1) throw Error('recovery write');
}
print('V7_OOM_PRESSURE_PASS');
