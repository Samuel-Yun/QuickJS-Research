function f(b){var m=1,c=0;while(m<256){if(b&m)c++;m<<=1;}return c;}__ex_begin();var result=f(255);__ex_end();if(result!==8)throw Error(result);
