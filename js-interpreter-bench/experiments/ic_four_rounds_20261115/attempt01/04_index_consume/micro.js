function f(a,n){var s=0;for(var i=0;i<n;i++)s+=a[0];return s;}
var a=[17,23],n=12000000,s=0;
var t=performance.now();
s=f(a,n);
print(JSON.stringify({elapsed_ms:performance.now()-t,sum:s,N:n}));
