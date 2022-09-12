include <_common.scad>;

divisions = 4;

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
          rotate([0, 0, -8]) translate([0, outerRad - fingerHoleRad - wallThickness, height - fingerHoleRad - wallThickness]) cube([(fingerHoleRad + wallThickness) * 2, fingerHoleRad + wallThickness, fingerHoleRad + wallThickness]);
          rotate([0, 0, -8]) translate([0, outerRad - fingerHoleRad - wallThickness, height - fingerHoleRad - wallThickness]) rotate([-45, 0, 0]) cube([(fingerHoleRad + wallThickness) * 2, fingerHoleRad + wallThickness, fingerHoleRad + wallThickness]);
          for (r = [90/divisions:90/divisions:90-90/divisions]) {
            rotate([0, 0, -r]) cube([wallThickness, outerRad * 2, height * 2 + 2], center = true);
          }
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

    difference() {
      rotate([0, 0, -8]) translate([wallThickness, outerRad - fingerHoleRad, height - fingerHoleRad - 9.9]) cube([fingerHoleRad * 2, fingerHoleRad + 5, fingerHoleRad + 10]);
      rotate([0, 0, -8]) translate([0, outerRad - fingerHoleRad, height - fingerHoleRad * 3 + .01]) rotate([5, 0, 0]) cube([fingerHoleRad * 3, fingerHoleRad + 10, fingerHoleRad * 2]);
    }
  }
  translate([0, 0, -1]) cube([100, 100, height + 2]);
}

translate([screwHoleYDistance, outerRad - screwHoleXDistance, height]) sphere(r = detentRad);
