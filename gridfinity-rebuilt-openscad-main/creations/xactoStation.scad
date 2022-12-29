include <../gridfinity-rebuilt-utility.scad>

gridfinityInit(2, 1, height(6), 0, 42) {
	cutEqual(n_divx = 3, n_divy = 1, style_tab = 5, enable_scoop = true);
}
gridfinityBase(2, 1, 42, 0, 0, 1);

translate([100, 0, 0]) {
  gridfinityInit(2, 1, height(12), 0, 42) {
    cutEqual(n_divx = 4, n_divy = 1, style_tab = 5, enable_scoop = false);
  }
  gridfinityBase(2, 1, 42, 0, 0, 1);
}

