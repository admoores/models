$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    //translate([0, 25, 25]) rotate([0, 90, 0]) fillet(r = 5, l = 15);
    difference() {
      cube([15, 50, 30]);
      translate([-.1, -.1, 20]) cube([15.2, 30.1, 30]);
    }
  }
  union() {
    translate([5, -.1, -.1]) cube([5, 45.1, 50.2]);
    translate([2.5, 14, 7.5]) rotate([90, 0, 0]) cylinder(r=1, h=15);
    translate([12.5, 14, 2.5]) rotate([90, 0, 0]) cylinder(r=1, h=15);
    translate([-.1, 6, -.1]) cube([15.2, .75, 10.1]);
    translate([-.1, 6, -.1]) cube([5.2, .75, 15.1]);
    translate([-.1, 4.9, 15.1]) rotate([0, -90, 180]) fillet(r = 5, l = 15.2);
    translate([15.1, 45.1, 25.1]) rotate([0, -90, 0]) fillet(r = 5, l = 15.2);
    translate([-.1, 34.9, 25.1]) rotate([0, -90, 180]) fillet(r = 5, l = 15.2);
    #translate([-.1, 20, 20]) rotate([0, 90, 0]) cylinder(r = 10, h = 15.2);
  }
}

module fillet(r, l) {
  difference() {
    cube([r, r, l]);
    translate([0, 0, -.1]) cylinder(h = l + .2, r = r);
  }
}