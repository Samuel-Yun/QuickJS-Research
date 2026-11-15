function Pair(a,b){this.x=a;this.y=b;}
function Wrap(){this.setup.apply(this,arguments);}
Wrap.prototype.setup=function(a,b){var p=new Pair(a,b);this.x=p.x;this.y=p.y;};
var n=500000,sum=0;__four_begin();var t=performance.now();for(var i=0;i<n;i++){var o=new Wrap(i,2,3);sum+=o.x+o.y;}__four_end();print(JSON.stringify({elapsed_ms:performance.now()-t,sum:sum,N:n}));
