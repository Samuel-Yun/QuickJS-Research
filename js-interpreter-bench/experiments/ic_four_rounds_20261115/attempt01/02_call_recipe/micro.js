function field(){return this.x;}
function call(o){var r=o.m();return r;}
var o={x:17,m:field},n=12000000,s=0;
var t=performance.now();
for(var i=0;i<n;i++)s+=call(o);
print(JSON.stringify({elapsed_ms:performance.now()-t,sum:s,N:n}));
