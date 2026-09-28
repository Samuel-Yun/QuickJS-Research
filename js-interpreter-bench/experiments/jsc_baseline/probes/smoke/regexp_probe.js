var pattern = /(?:ab|cd)+[0-9]{2}/;
var matches = 0;
for (var i = 0; i < 1000; ++i) {
    if (pattern.test('xxabab12yy'))
        ++matches;
}
if (matches !== 1000)
    throw new Error('REGEXP_FAIL:' + matches);
print('REGEXP_PASS:' + matches);
