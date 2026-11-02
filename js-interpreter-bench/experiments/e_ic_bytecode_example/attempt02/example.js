function readPlusOne(o) {
    return o.x + 1;
}

var exampleObject = { x: 3 };
var exampleChecksum = 0;
for (var exampleIndex = 1; exampleIndex <= 10; exampleIndex++) {
    var exampleResult = readPlusOne(exampleObject);
    if (exampleResult !== 4) throw new Error('Unexpected result');
    exampleChecksum += exampleResult;
    // The diagnostic snapshot is taken at this native print entry, after return.
    print('AFTER ' + exampleIndex + ' result=' + exampleResult + ' checksum=' + exampleChecksum);
}
if (exampleChecksum !== 40) throw new Error('Unexpected checksum');
