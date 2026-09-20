"use strict";

const prototypeObject = { inherited: 7 };
const object = Object.create(prototypeObject);
object.a = 11;
object["b"] = 13;

for (let i = 0; i < 20; i++) {
  object["k" + i] = i * i;
}

let checksum = object.a + object.b + object.inherited;
for (let i = 0; i < 20; i++) {
  checksum += object["k" + i];
}

delete object.k3;
checksum += "k3" in object ? 100000 : 17;
checksum += Object.keys(object).length * 19;

console.log("CHECKSUM:object_property_access:" + checksum);
