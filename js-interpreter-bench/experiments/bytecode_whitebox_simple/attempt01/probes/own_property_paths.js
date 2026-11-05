function wbOwnProperty(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += obj.value;
    }
    return sum;
}
// Creation occurs before the timer; a stable ordinary own data property.
var wbOwnObject = {value: 3};

__mlDiagBegin(wbOwnObject,wbOwnProperty,{},{},{},{},Function.prototype.call);
var __wbAnswer=wbOwnProperty(wbOwnObject, 4096);
var __wbPaths=__mlDiagEnd();
if(__wbAnswer!==12288) throw Error('wrong result');
console.log('PATHS '+__wbPaths);
