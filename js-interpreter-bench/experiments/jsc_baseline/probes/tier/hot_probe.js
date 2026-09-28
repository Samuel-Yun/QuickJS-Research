function hotFunction(x) {
    return ((x + 1) ^ 123) | 0;
}
var checksum = 0;
for (var i = 0; i < 500000; ++i)
    checksum = (checksum + hotFunction(i)) | 0;
print('TIER_CHECKSUM:' + checksum);
