$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cylinder(r = 28, h = 125);
  translate([0, 0, 2]) cylinder(r = 26, h = 125);
  translate([-50, -20, 25]) cube([100, 100, 200]);
  translate([0, -10, 100]) rotate([90, 0, 0]) cylinder(r = 10, h = 25);
  translate([0, -10, 104]) rotate([90, 0, 0]) fillet(22, 25);
  translate([0, -10, 104]) rotate([90, -90, 0]) fillet(22, 25);
}

module fillet(r, l) {
  difference() {
    cube([r, r, l]);
    translate([0, 0, -.1]) cylinder(h = l + .2, r = r);
  }
}