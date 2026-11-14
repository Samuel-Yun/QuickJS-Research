'use strict';
var tests=0;
function eq(a,b){tests++;if(!Object.is(a,b))throw Error(a+' != '+b);}
function bits(b){var m=1,c=0;while(m<256){if(b&m)c++;m<<=1;}return c;}
function seeded(b,start){var m=1,c=start;while(m<256){if(b&m)c++;m<<=1;}return c;}
function ref(b){var r=0;for(var j=0;j<8;j++)r+=(b>>>j)&1;return r;}
for(var b=0;b<256;b++)eq(bits(b),ref(b));
for(var b of [-1,256,65535,5.5,'7',null,undefined])eq(bits(b),ref(b));
eq(seeded(255,2147483647),2147483655);
eq(seeded(255,1.5),9.5);
eq(seeded(255,'x'),NaN);
print('BITS_SAFETY_PASS '+tests);
