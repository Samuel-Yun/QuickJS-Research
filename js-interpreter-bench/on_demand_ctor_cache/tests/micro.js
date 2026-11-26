function C(a,b){this.x=a;this.y=b;}var n=1000000,sum=0;
var t=performance.now();for(var i=0;i<n;i++){var o=new C(i,2);sum+=o.x+o.y;}print(JSON.stringify({elapsed_ms:performance.now()-t,sum:sum,N:n}));