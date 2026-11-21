// Small input for inspecting the post-execution read and constructor paths.
function ownRead(o) { return o.x; }
function Pair(x, y) { this.x = x; this.y = y; }
function construct(x, y) { return new Pair(x, y); }

// Keep the existing empty-shape prerequisite available for plan learning.
var empty = Object.create(Pair.prototype);
var sum = 0;
for (var i = 0; i < 100; i++) {
    var obj = construct(3, 4);
    sum += ownRead(obj) + obj.y;
}
if (sum !== 700 || Object.getPrototypeOf(empty) !== Pair.prototype)
    throw Error('wrong result');
print('sum=' + sum);
