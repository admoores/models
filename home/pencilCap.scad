include <../_constants.scad>

od1 = 6.25;
od2 = 5.75;

tw = 0.35;

h1 = 7.5;
h2 = 13;

roundedTopHeight = 1.6;

text = "4B";

// difference() {
//   union() {
//     cylinder(r = od1 / 2, h = h1);
//     translate([0, 0, h1]) sphere(r = od1/2);
//     cylinder(r = od2 / 2, h = h2);
//     translate([0, 0, h2]) sphere(r = od2/2);
//   }

//   translate([0, 0, -eps]) {
//     cylinder(r = od1 / 2 - tw, h = h1 - tw + eps);
//     translate([0, 0, h1 - tw]) sphere(r = od1/2 - tw);
//     cylinder(r = od2 / 2 - tw, h = h2 - tw * 2 - od2/2);
//     translate([0, 0, h2 - tw * 2 - od2/2]) sphere(r = od2/2 - tw);
//     translate([0, 0, h2]) {
//       translate([0, 0, roundedTopHeight]) cylinder(r = od2, h = od2);
//       linear_extrude(roundedTopHeight + eps) text(text, valign = "center", halign = "center", size=2.5, font=defaultFont);
//     }
//   }
// }

difference() {
  union() {
    cylinder(r = od1/2, h = h1);
    translate([0, 0, h1]) sphere(r = od1/2);
  }

  translate([0, 0, -eps]) cylinder(r = od1 / 2 - tw, h = h1 - tw + eps);
  translate([0, 0, h1 + roundedTopHeight]) cylinder(r=od1, h=od1);
  translate([0, 0, h1]) linear_extrude(roundedTopHeight + eps) text(text, valign = "center", halign = "center", size=2.75, font=defaultFont);
}