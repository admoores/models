$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cube([150, 55, 5]);
  translate([5, -1, -1]) cube([140, 51, 7]);
}