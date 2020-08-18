$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

tol = .1;
wallThickness = 3.2;
holeRad = 6.75 + tol;

difference() {
  translate([-holeRad - wallThickness, -holeRad - wallThickness, 0]) cube([(holeRad + wallThickness) * 2, (holeRad + wallThickness) * 2, 5]);
  translate([0, 0, -.1]) cylinder(h = 5.2, r = holeRad, center = false);
}