$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    cylinder(r = 15, h = 5);
    cylinder(r = 7, h = 25);
  }
  translate([8, 0, -1]) cylinder(r = 1.5, h = 100);
  translate([-8, 0, -1]) cylinder(r = 1.5, h = 100);
}