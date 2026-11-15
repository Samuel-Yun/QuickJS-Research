function f(re,s){return re.ping(s);}RegExp.prototype.ping=function(s){return s;};var re=/a/;__b3_begin();for(var i=0;i<32;i++)if(f(re,i)!==i)throw Error(i);__b3_end();
