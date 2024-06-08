include <_common.scad>;

partialHeight = wallThickness;

intersection() {
  difference() {
    cylinder(r = outerRad, h = partialHeight);
    translate([0, 0, -1]) cylinder(r = innerRad * 2.2, h = partialHeight + 2);
    translate([outerRad - screwHoleXDistance, screwHoleYDistance, -1]) cylinder(r = m3TapRad, h = partialHeight + 2);
    translate([-.01, 0, -.5]) cube([1, outerRad + 1, partialHeight + 1]);
    translate([outerRad - screwHoleYDistance, screwHoleYDistance - .01, -1.5]) rotate([0, 0, -90]) difference() {
      cube([screwHoleYDistance, screwHoleYDistance, partialHeight + 3]);
      translate([0, 0, -.5]) cylinder(r = screwHoleYDistance, h = partialHeight + 3);
    }
    translate([0, 0, .01]) difference() {
      intersection() {
        difference() {
          cylinder(r = outerRad - wallThickness, h = partialHeight);
          translate([0, 0, -1]) cylinder(r = innerRad + wallThickness, h = partialHeight + 2);
          translate([wallThickness -.01, 0, -.5]) cube([1, outerRad + 1, partialHeight + 1]);
          // translate([wallThickness, outerRad - wallThickness, partialHeight / 2]) sphere(r = fingerHoleRad + wallThickness);
        }
        translate([wallThickness, wallThickness, wallThickness]) cube([100, 100, partialHeight]);
      }
      translate([outerRad - screwHoleYDistance - wallThickness + .01, screwHoleYDistance + wallThickness - .01, -1.5]) rotate([0, 0, -90]) difference() {
        cube([screwHoleYDistance, screwHoleYDistance, partialHeight + 3]);
        translate([0, 0, -.5]) cylinder(r = screwHoleYDistance, h = partialHeight + 4);
      }
      translate([outerRad - screwHoleXDistance, screwHoleYDistance, -1]) cylinder(r = m3TapRad * 5, h = partialHeight + 2);
      translate([screwHoleYDistance, outerRad - screwHoleXDistance, -1]) cylinder(r = m3TapRad * 5, h = partialHeight + 2);
    }

    // translate([wallThickness, outerRad - wallThickness, partialHeight / 2]) sphere(r = fingerHoleRad);
    // translate([screwHoleYDistance, outerRad - screwHoleXDistance, 0]) sphere(r = detentRad + .2);
  }
  translate([0, 0, -1]) cube([100, 100, partialHeight + 2]);
}

translate([screwHoleYDistance, outerRad - screwHoleXDistance, partialHeight]) sphere(r = detentRad);