function __wbKernel(x,x0) {
  var width=64,height=64,rowSize=66,iterations=20,a=1,invC=0.25;
  for(var k=0;k<iterations;k++)for(var j=1;j<=height;j++) {
    var lastRow=(j-1)*rowSize,currentRow=j*rowSize,nextRow=(j+1)*rowSize;
    var lastX=x[currentRow];++currentRow;
    for(var i=1;i<=width;i++)
      lastX=x[currentRow]=(x0[currentRow]+a*(lastX+x[++currentRow]+x[++lastRow]+x[++nextRow]))*invC;
  }
  return 0;
}
