$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cylinder(h = 17.5, r = 4);
  translate([0, 0, 10]) cylinder(h = 15, r = 2.5);
}