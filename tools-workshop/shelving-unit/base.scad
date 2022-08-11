include <../../modules/fillet.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm


railDiam = 3;
width = 5;
railDistance = 30;
wallThickness = 2.4;
height = 10;

difference() {
  cube([railDistance * 2 + wallThickness * 2, height, width]);
  translate([wallThickness, -.1, -.1]) cube([railDistance * 2, railDiam * 1.5, width + .2]);
  translate([wallThickness, railDiam, -.1]) cylinder(r = railDiam / 2, h = width + .2);
  translate([wallThickness + railDistance * 2, railDiam, -.1]) cylinder(r = railDiam / 2, h = width + .2);
}