include <_common.scad>
include <../../home/drawers/_common.scad>

union() {
  difference() {
    base(unit, railDiam * 3/2 + wallThickness, 5);
    translate([-15, railDiam * 3/2 - .11, 0]) for (x = [0:30:depth]) {
      for (z = [0:30:unit]) {
        translate([x, 0, z]) rotate([0, 45, 0]) cube([15, wallThickness + 1, 15]);
        translate([x + 15, 0, z + 15]) rotate([0, 45, 0]) cube([15, wallThickness + 1, 15]);
      }
    }
  }

  difference() {
    translate([0, railDiam * 3/2, 0]) cube([railDistance * 5 + wallThickness * 2, wallThickness, unit]);
    translate([wallThickness, railDiam * 3/2, wallThickness]) cube([railDistance * 5, wallThickness + 5, unit - wallThickness * 2]);
  }

  translate([0, railDiam * 3/2, unit / 2 - sphereDetentRad * 3/2]) cube([railDistance * 5 + wallThickness * 2, wallThickness, sphereDetentRad * 3]);

  translate([depth / 4, railDiam * 3/2 + wallThickness, unit / 2]) sphere(r = sphereDetentRad - tolerance / 2);
  translate([depth / 2, railDiam * 3/2 + wallThickness, unit / 2]) sphere(r = sphereDetentRad - tolerance / 2);
  translate([depth / 4 * 3, railDiam * 3/2 + wallThickness, unit / 2]) sphere(r = sphereDetentRad - tolerance / 2);
}
