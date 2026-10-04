;(function () {
  var __tebPattern = /(?:ab|cd)+[0-9]{2}/;
  var __tebMatches = 0;
  for (var __tebRegexIndex = 0; __tebRegexIndex < 1000; ++__tebRegexIndex)
    if (__tebPattern.test('xxabab12yy')) ++__tebMatches;
  if (__tebMatches !== 1000) throw new Error('regexp correctness failure');
  print('TEB_REGEXP_PASS:' + __tebMatches);
})();
