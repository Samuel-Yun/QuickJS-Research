var calls=0,out=[],points=[];
function Bad(a){calls++;if(a<0)throw marker;this.x=a+1;}
function Good(a){this.x=a;}
var marker={};Bad(0);
for(var k=0;k<100;k++)points.push(eval('(function(c,a){return new c(a);})'));
for(k=0;k<100;k++){
 var p=points[k];out.push(p(Bad,1).x,p(Bad,2).x,p(Good,7).x,p(Bad,3).x);
 try{p(Bad,-1);}catch(e){out.push(e===marker);}
}
print(JSON.stringify([calls,out]));points=null;
