include <../../modules/fillet.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm


railDiam = 3;
railDistance = 30;
wallThickness = 2.4;
// height = 20;


module base(b, h, rails = 2) {
  difference() {
    cube([railDistance * rails + wallThickness * 2, h, b]);
    translate([wallThickness, -.1, -.1]) cube([railDistance * rails, railDiam * 1.5, b + .2]);
    translate([wallThickness, railDiam, -.1]) cylinder(r = railDiam / 2, h = b + .2);
    translate([wallThickness + railDistance * rails, railDiam, -.1]) cylinder(r = railDiam / 2, h = b + .2);
  }
}