function f(a){var s=0;s+=a[0];return s;}
var a=[17,23],n=12000000,s=0;
__four_begin();var t=performance.now();
for(var i=0;i<n;i++)s+=f(a);
__four_end();print(JSON.stringify({elapsed_ms:performance.now()-t,sum:s,N:n}));
