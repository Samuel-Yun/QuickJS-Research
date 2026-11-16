'use strict';
__four_begin();
function Node(x,y,z){this.x=x;this.y=y;this.z=z;}
var empty=Object.create(Node.prototype),a=[1,2,3,4],sum=0;
function both(a,n){var s=0,k=0,o;for(var i=0;i<n;i++){o=new Node(i,2,3);s+=a[i&3];k+=o.x;}return s+k;}
for(var j=0;j<8;j++)sum+=both(a,64);
var n=2000000;
var t=performance.now();
sum+=both(a,n);
print(JSON.stringify({elapsed_ms:performance.now()-t,sum:sum,N:n}));

__four_end();
