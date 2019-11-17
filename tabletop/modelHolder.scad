$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    cylinder(r=10, h=5);
    translate([0, 0, 5]) cylinder(r1=10, r2=6, h=20);
    translate([0, 0, 25]) cylinder(r1=6, r2=8, h=20);
  }
  translate([0, 0, 42.5]) cylinder(r = 5.15, h = 2.6);
}