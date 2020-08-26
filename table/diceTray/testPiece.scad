include <_common.scad>

difference() {
  cube([20, 10, wallThickness], center=true);

  translate([-5, 0, -20]) union() {
    translate([0, 0, 19.99]) linear_extrude(20) hexagon(r = nutRad);
    cylinder(h = 20, r = screwRad);
  }

  translate([5, 0, -20]) {
    translate([0, 0, 19.99]) cylinder(h = 20, r = screwHeadRad);
    cylinder(h = 20, r = screwRad);
  }
}