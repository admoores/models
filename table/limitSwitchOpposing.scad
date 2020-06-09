$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

union() {
  difference() {
    union() {
      cube([2.5, 40, 13]);
      translate([0, 25, 0]) cube([7.5, 15, 13]);
      translate([-2.5, 7.5, 6.5]) rotate([0, 90, 0]) cylinder(h = 2.6, r=2.25);
    }
    translate([-1, 32.5, 6.5]) rotate([0, 90, 0]) cylinder(h = 15, r=3.25);
  }
  translate([0, -10, 0]) cube([12.5, 10, 13]);
}