$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cube([5, 20, 20]);
  union() {
    translate([5, 5, -2.5]) cube([16, 16, 25]);
    #translate([-.1, 10, 10]) rotate([0, 90, 0]) cylinder(r = 5.1, h = 2.2);
    translate([10, 2.5, 10]) rotate([90, 0, 0]) cylinder(r = 5.05, h = 2.1);
    translate([10, .4, 4.95]) cube([15, 2.1, 10]);
  }
}
