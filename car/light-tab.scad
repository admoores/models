$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm


difference() {
  union() {
    cylinder(r = 4, h=13);
    translate([0, 0, 13]) sphere(r=4);
  }
  union() {
    translate([2, -5, 0]) cube([10, 10, 20]);
    translate([-5, -.5, 0]) cube([10, 1, 10]);
  }
}