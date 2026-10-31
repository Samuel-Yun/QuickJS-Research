function __wbKernel(items,unused) {
  var sum=0;
  for(var round=0;round<256;round++)for(var i=0;i<1024;i++) {
    var item=items[i];
    if((item.state&4)!==0 || item.state===2)sum++;
  }
  return sum;
}
