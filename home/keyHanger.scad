$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference () {
  cube([15, 45, 7]);
  translate([7.5, 22.5, ]) cylinder(r = 5, h = 6);
}