$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

innerRad = 7.2;
wallThickness = 2.4;
tolerance = .3;
height = 6;

difference() {
  cylinder(r = innerRad + 2*wallThickness + tolerance, h = height);
  translate([0, 0, -.1]) cylinder(r = innerRad + wallThickness + tolerance, h = height + .2);
}