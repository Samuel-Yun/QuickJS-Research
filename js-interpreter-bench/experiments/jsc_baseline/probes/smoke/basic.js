function twice(x) { return x * 2; }
var total = 0;
for (var i = 0; i < 10; ++i)
    total += i;
var object = { value: 5 };
var checksum = total + twice(7) + object.value
    + (/foo/.test('xxfooyy') ? 1 : 0) + eval('21 + 21');
if (checksum !== 107)
    throw new Error('SMOKE_FAIL:' + checksum);
print('SMOKE_PASS:' + checksum);
