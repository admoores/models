$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    cube([20, 40, 5]);
    cube([20, 5, 6]);
  }

  union() {
    translate([3, 35, -.1]) cube([14, 1.5, 5.2]);
    #translate([10, 45, 2.5]) rotate([90, 0, 0]) cylinder(r = 1, h = 9);
  }
}