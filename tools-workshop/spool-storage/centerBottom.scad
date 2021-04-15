include <_common.scad>;

difference() {
  cylinder(r = holeRad, h = 10);
  translate([0, 0, wallThickness]) cylinder(r = holeRad - wallThickness, h = 10);
}