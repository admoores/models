$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

difference () {
  union() {
    cylinder(r = 50, h = 5);
    cylinder(r = 4, h = 10);
    rotate([0, 0, 0]) translate([25, 0, 0]) cylinder(r = 4, h = 15);
    rotate([0, 0, 90]) translate([35, 0, 0]) cylinder(r = 4, h = 12.5);
    rotate([0, 0, 250]) translate([45, 0, 0]) cylinder(r = 4, h = 17.5);
  }
  union() {
    difference() {
      translate([0, 0, 4.5]) cylinder(r = 40.5, h = 1);
      translate([0, 0, 4.4]) cylinder(r = 39.5, h = 1.2);
    }
    difference() {
      translate([0, 0, 4.5]) cylinder(r = 30.5, h = 1);
      translate([0, 0, 4.4]) cylinder(r = 29.5, h = 1.2);
    }
    difference() {
      translate([0, 0, 4.5]) cylinder(r = 20.5, h = 1);
      translate([0, 0, 4.4]) cylinder(r = 19.5, h = 1.2);
    }
    translate([0, 0, 10]) sphere(r = 3);
    rotate([0, 0, 0]) translate([25, 0, 15]) sphere(r = 3);
    rotate([0, 0, 90]) translate([35, 0, 12.5]) sphere(r = 3);
    rotate([0, 0, 250]) translate([45, 0, 17.5]) sphere(r = 3);
  }
}
