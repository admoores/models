$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    cube([12, 37, 6.5]);
  }
  union() {
    translate([6, 4, -.1]) cylinder(r=3.25, h=13);
    translate([3.4, -.1, -.1]) cube([5.2, 3, 13]);
    translate([-.1, 10, 1.6]) cube([12.2, 27.5, 3.3]);
  }
}

    translate([0, 36, 5]) rotate([0, 90, 0]) cylinder(r=1, h=12);
    translate([0, 36, 1.5]) rotate([0, 90, 0]) cylinder(r=1, h=12);