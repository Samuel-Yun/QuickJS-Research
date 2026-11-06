#define main search_layout_main
#include "layout_probe.c"
#undef main
#define main search_delete_main
#include "/mnt/c/Users/mzyx/Desktop/0921/js-interpreter-bench/experiments/ic_search_lab/v2_20261105/delete_reentry.c"
#undef main
int main(void) {int r = search_layout_main(); if (r) return r; return search_delete_main();}
