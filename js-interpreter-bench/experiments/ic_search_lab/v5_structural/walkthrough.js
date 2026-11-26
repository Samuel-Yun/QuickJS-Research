function read(o) { return o.value; }
var a={value:10};
var b={pad:0,value:20};
var values=[read(a),read(a)];
a.value=11;
values.push(read(a),read(b),read(b));
if(values.join(',')!=='10,10,11,20,20')throw Error('walkthrough');
print('WALKTHROUGH_PASS '+values.join(','));
