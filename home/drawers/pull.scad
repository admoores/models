include <_common.scad>

difference() {
  union() {
    difference() {
      sphere(r = unit / 8);
      translate([0, 0, unit / -16]) cube([unit / 4, unit / 4, unit / 8], center = true);
    }
    translate([0, 0, unit / -16]) cylinder(r1 = unit / 16, r2 = unit / 8, h = unit / 8, center = true);
  }
  linear_extrude(unit / 8) hexagon(r = nutRad);
  cylinder(r = screwRad + tolerance / 2, h = unit, center = true);
}
