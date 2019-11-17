$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    translate([0, 10, 10]) rotate([0, 90, 0]) cylinder(r = 10, h = 4);
    cube([4, 10, 20]);
    cube([20, 2.5, 20]);
  }
  union() {
    translate([-.1, 10, 10]) rotate([0, 90, 0]) cylinder(r = 5.2, h = 2.3);
    translate([17.6, .3, -.1]) fillet(2.5, 20.2);
    #translate([10, 4, 10]) rotate([90, 0, 0]) cylinder(r=2.55, h=5);
  }
}


module fillet(r, l) {
  difference() {
    cube([r, r, l]);
    translate([0, 0, -.1]) cylinder(h = l + .2, r = r);
  }
}