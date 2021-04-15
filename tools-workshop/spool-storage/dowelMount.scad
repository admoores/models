include <_common.scad>;

difference() {
  cube([15, 20, 10]);
  translate([7.5, 10, wallThickness]) cylinder(r = dowelRad, h = 10);
}