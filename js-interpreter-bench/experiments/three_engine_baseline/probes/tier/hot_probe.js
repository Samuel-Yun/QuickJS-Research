function __tebHotTarget(value) {
  var result = Math.imul((value | 0) + 17, 31);
  result ^= result >>> 7;
  return result | 0;
}
var __tebHotChecksum = 0;
for (var __tebHotIndex = 0; __tebHotIndex < 500000; ++__tebHotIndex)
  __tebHotChecksum = (__tebHotChecksum + __tebHotTarget(__tebHotIndex)) | 0;
if (__tebHotChecksum !== 1301262660) throw new Error('hot probe checksum mismatch');
print('TEB_HOT_PASS:500000:' + __tebHotChecksum);
