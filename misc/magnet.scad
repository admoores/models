$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    cylinder(r=8, h=5);
    translate([0, 0, 5]) cylinder(r1=8, r2=3, h=15);
    translate([0, 0, 20]) sphere(r=6);
  }
  translate([0, 0, -.1]) cylinder(r = 5.15, h = 2.6);
}