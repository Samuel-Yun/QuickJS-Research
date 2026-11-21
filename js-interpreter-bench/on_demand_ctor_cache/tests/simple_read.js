function readX(o) {
    return o.x;
}

var obj = {x: 7};
var sum = 0;
for (var i = 0; i < 10; i++) {
    sum += readX(obj);
}
print(sum);
