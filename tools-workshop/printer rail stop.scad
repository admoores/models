$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cylinder(r = 5.5, h = 7.5);
  cylinder(r = 4, h = 7.5);
  translate([-10, 2, 0]) cube([20, 10, 10]);
  }