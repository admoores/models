include <_common.scad>;

hole = true;

difference() {
  union() {
    cylinder(r = holeRad - holeRadOffset, h = 10);
    cylinder(r1 = holeRad + wallThickness / 3, r2 = holeRad, h = wallThickness);
  }
  translate([0, 0, wallThickness]) cylinder(r = holeRad - holeRadOffset - wallThickness, h = 10);
  if (hole) {
    translate([0, 0, -.01]) cylinder(r = fingerHoleRad, h = wallThickness + .02);
  }
}