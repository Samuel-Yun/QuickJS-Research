function wbOwnProperty(obj, n) {
    var sum = 0;
    for (var i = 0; i < n; i++) {
        sum += obj.value;
    }
    return sum;
}
// Creation occurs before the timer; a stable ordinary own data property.
var wbOwnObject = {value: 3};
