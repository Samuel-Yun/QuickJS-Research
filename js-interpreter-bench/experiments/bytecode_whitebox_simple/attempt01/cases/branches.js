// Fixed sequence; each arm executes twice. The independent sum is 3+8+1+16=28.
function wbBranches(values) {
    var sum = 0;
    for (var i = 0; i < values.length; i++) {
        var x = values[i];
        if (x >= 0) sum += x * 2;
        else sum -= x;
    }
    return sum;
}
var wbBranchInput = [-3, 4, -1, 8];
