function readPlusOne(o) {
    return o.x + 1;
}

var exampleObject = { x: 3 };
var exampleChecksum = 0;
for (var exampleIndex = 0; exampleIndex < 12; exampleIndex++) {
    exampleChecksum += readPlusOne(exampleObject);
}
if (exampleChecksum !== 48) throw new Error('Unexpected result');
print('IC_EXAMPLE_CHECKSUM ' + exampleChecksum);
