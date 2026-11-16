function numeric(n) {
    var sum=0;
    for(var i=0;i<n;i++)sum+=i;
    return sum;
}
if(numeric(65536)!==2147450880)throw Error('numeric control');
print('NUMERIC_CONTROL_PASS');
