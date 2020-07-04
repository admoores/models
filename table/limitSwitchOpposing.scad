$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

union() {
  difference() {
    union() {
      cube([2.5, 40, 20]);
      translate([0, 25, 0]) cube([7.5, 15, 20]);
      translate([-2.5, 7.5, 10]) rotate([0, 90, 0]) cylinder(h = 2.6, r=2.25);
    }
    translate([-1, 32.5, 10]) rotate([0, 90, 0]) cylinder(h = 15, r=3.25);
  }
  translate([0, -75, 0]) cube([2.5, 75, 20]);
  translate([0, -75, 0]) cube([12.5, 5, 20]);
}