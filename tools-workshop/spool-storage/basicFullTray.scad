include <_common.scad>;

intersection() {
  difference() {
    cylinder(r = outerRad, h = height);
    translate([0, 0, -1]) cylinder(r = innerRad, h = height + 2);
    translate([outerRad - screwHoleXDistance, screwHoleYDistance, -1]) cylinder(r = m3TapRad, h = height + 2);
    translate([-.01, 0, -.5]) cube([1, outerRad + 1, height + 1]);
    translate([outerRad - screwHoleYDistance, screwHoleYDistance - .01, -1.5]) rotate([0, 0, -90]) difference() {
      cube([screwHoleYDistance, screwHoleYDistance, height + 3]);
      translate([0, 0, -.5]) cylinder(r = screwHoleYDistance, h = height + 3);
    }
    translate([0, 0, .01]) difference() {
      intersection() {
        difference() {
          cylinder(r = outerRad - wallThickness, h = height);
          translate([0, 0, -1]) cylinder(r = innerRad + wallThickness, h = height + 2);
          translate([wallThickness -.01, 0, -.5]) cube([1, outerRad + 1, height + 1]);
        }
        translate([wallThickness, wallThickness, wallThickness]) cube([100, 100, height]);
      }
      translate([outerRad - screwHoleYDistance - wallThickness + .01, screwHoleYDistance + wallThickness - .01, -1.5]) rotate([0, 0, -90]) difference() {
        cube([screwHoleYDistance, screwHoleYDistance, height + 3]);
        translate([0, 0, -.5]) cylinder(r = screwHoleYDistance, h = height + 4);
      }
      translate([outerRad - screwHoleXDistance, screwHoleYDistance, -1]) cylinder(r = m3TapRad * 5, h = height + 2);
      translate([screwHoleYDistance, outerRad - screwHoleXDistance, -1]) cylinder(r = m3TapRad * 5, h = height + 2);
    }

    translate([0, outerRad, height / 2]) sphere(r = fingerHoleRad);
  }
  translate([0, 0, -1]) cube([100, 100, height + 2]);
}

translate([screwHoleYDistance, outerRad - screwHoleXDistance, height]) sphere(r = detentRad);
