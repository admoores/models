$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    cylinder(h = 2.5, r = 10);
    translate([26, 0, 0]) cylinder(h = 2.5, r = 20);
  }

  translate([0, 0, -.1]) union() {
    cylinder(h = 2.7, r = 6);
    translate([26, 0, 0]) cylinder(h = 2.7, r = 15);
  }
}