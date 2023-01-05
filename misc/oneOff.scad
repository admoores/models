include <../_constants.scad>

// topCutoff = 2;

// difference() {
//   sphere(r = 12.5);
//   translate([0, 0, -12.5]) {
//   }
//   translate([0, 0, -12.5]) cylinder(r = 20, h = topCutoff);
//   translate([0, 0, -4.5]) cylinder(r1 = 4, r2 = 3.7, h = 1 + eps);
//   translate([0, 0, -3.5]) cylinder(r2 = 6.25, r1 = 3.7, h = 1.5 + eps);
//   translate([0, 0, -2]) cylinder(r = 6.25, h = 20);
//   translate([0, 0, -7]) sphere(r = 4);
// }