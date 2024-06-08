$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

height = 15;
width = 20;
length = 59;

wallThickness = 3.2;

difference() {
  cube([width, length, height]);
  translate([wallThickness, wallThickness, -.1]) cube([width - wallThickness * 2, length - wallThickness * 2, height + .2]);
}