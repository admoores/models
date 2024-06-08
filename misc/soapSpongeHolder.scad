include <../modules/fillet.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm



length = 120;
width = 100; 
depth = 5;

difference() {
  union() {
    cube([length, width, depth]);
    for (y = [0:7]) {
      translate([5, (y + 1.5) * 10, depth]) cylinder(r = 2, h = depth * 3);
      translate([5, (y + 1.5) * 10, depth * 4]) sphere(r = 2);
    }
    for (y = [0:7]) {
      translate([35, (y + 1.5) * 10, depth]) cylinder(r = 2, h = depth * 3);
      translate([35, (y + 1.5) * 10, depth * 4]) sphere(r = 2);
    }
  }

  union() {
    translate([10, 10, -.1]) rotate([0, 0, 180]) fillet(r = 10.1, l = depth + .2);
    translate([length - 10, 10, -.1]) rotate([0, 0, -90]) fillet(r = 10.1, l = depth + .2);
    translate([length - 10, width - 10, -.1]) rotate([0, 0, 0]) fillet(r = 10.1, l = depth + .2);
    translate([10, width - 10, -.1]) rotate([0, 0, 90]) fillet(r = 10.1, l = depth + .2);

    for (x = [0:2:10]) {
      for (y = [0:8]) {
        translate([(x + 1) * 10, (y + 1) * 10, -0.1]) cylinder(r = 3, h = depth + .2);
      }
    }

   for (x = [1:2:10]) {
     if (x != 3) {
        for (y = [0:7]) {
          translate([(x + 1) * 10, (y + 1.5) * 10, -0.1]) cylinder(r = 3, h = depth + .2);
        }
     }
    }

    translate([45, 5, depth / 2]) difference() {
      cube([70, 90, depth]);
      translate([5, 5, -.1]) rotate([0, 0, 180]) fillet(r = 5.1, l = 5.2);
      translate([65, 5, -.1]) rotate([0, 0, -90]) fillet(r = 5.1, l = 5.2);
      translate([65, 85, -.1]) rotate([0, 0, 0]) fillet(r = 5.1, l = 5.2);
      translate([5, 85, -.1]) rotate([0, 0, 90]) fillet(r = 5.1, l = 5.2);
    }
  }
}