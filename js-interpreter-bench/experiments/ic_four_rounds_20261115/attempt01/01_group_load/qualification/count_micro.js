function f(o){return o.x+o.y;}
var o={x:17,y:23},n=12000000,s=0;
__four_begin();var t=performance.now();
for(var i=0;i<n;i++)s+=f(o);
__four_end();print(JSON.stringify({elapsed_ms:performance.now()-t,sum:s,N:n}));
