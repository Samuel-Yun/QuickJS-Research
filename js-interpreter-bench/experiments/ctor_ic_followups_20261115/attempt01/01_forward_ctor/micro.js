function Wrap(){this.setup.apply(this,arguments);}
Wrap.prototype.setup=function(a,b,c){this.x=a;this.y=b;this.z=c;};
var n=500000,s=0;
var t=performance.now();
for(var i=0;i<n;i++){var o=new Wrap(i,2,3);s+=o.x;}
print(JSON.stringify({elapsed_ms:performance.now()-t,sum:s,N:n}));
