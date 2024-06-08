include <../../modules/fillet.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm


railDiam = 3;
width = 20;
railDistance = 30;
wallThickness = 2.4;
height = 10;

bookendHeight = 150;

difference() {
  cube([railDistance * 2 + wallThickness * 2, height, width]);
  translate([wallThickness, -.1, -.1]) cube([railDistance * 2, railDiam * 1.5, width + .2]);
  translate([wallThickness, railDiam, -.1]) cylinder(r = railDiam / 2, h = width + .2);
  translate([wallThickness + railDistance * 2, railDiam, -.1]) cylinder(r = railDiam / 2, h = width + .2);
}

difference() {
  linear_extrude(width) {
    polygon(points = [[0, height], [railDistance + wallThickness, bookendHeight], [railDistance * 2 + wallThickness * 2, height]], paths=[[0, 1, 2]]);
  }
  translate([0, 0, -.1]) linear_extrude(width + .2) {
    polygon(points = [[12, height + 12], [railDistance + wallThickness, bookendHeight - 12], [railDistance * 2 + wallThickness * 2 - 12, height + 12]], paths=[[0, 1, 2]]);
  }
  translate([-10, -10, 23]) rotate([-8, 0, 0]) cube([100, 200, 25]);
}