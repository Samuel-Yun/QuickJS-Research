function C(x,y,z){this.x=x;this.y=y;this.z=z;}
var n=2000000,s=0;
var t=performance.now();
for(var i=0;i<n;i++){var o=new C(i,2,3);s+=o.x;}
print(JSON.stringify({elapsed_ms:performance.now()-t,sum:s,N:n}));
