include <_common.scad>;

// intersection() {
//   difference() {
//     cylinder(r = outerRad, h = 1, center = true);
//     cylinder(r = innerRad * 2, h = 2, center = true);
//     translate([outerRad - screwHoleXDistance, screwHoleYDistance, 0]) cylinder(r = m3TapRad, h = 3, center = true);
//     translate([0, 0, -1]) cube([1, outerRad + 1, height + 1]);
//     translate([outerRad - screwHoleYDistance, screwHoleYDistance, -1.5]) rotate([0, 0, -90]) difference() {
//       cube([screwHoleYDistance, screwHoleYDistance, height + 3]);
//       translate([0, 0, -.5]) cylinder(r = screwHoleYDistance, h = height + 3);
//     }
//   }
//   translate([0, 0, -5]) cube([100, 100, 10]);
// }

cylinder(r = 10, h = .9);
cylinder(r = 3, h = height);
translate([0, 0, height]) sphere(r = detentRad);