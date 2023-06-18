include <_common.scad>;

hDiv = 4;
vDiv = 2;

vTolerance = .1 * (vDiv - 1);
trayHeight = (height / vDiv) - .1;


intersection() {
  difference() {
    cylinder(r = outerRad, h = trayHeight);
    translate([0, 0, -1]) cylinder(r = innerRad, h = trayHeight + 2);
    translate([outerRad - screwHoleXDistance, screwHoleYDistance, -1]) cylinder(r = m3TapRad, h = trayHeight + 2);
    translate([-.01, 0, -.5]) cube([1, outerRad + 1, trayHeight + 1]);
    translate([outerRad - screwHoleYDistance, screwHoleYDistance - .01, -1.5]) rotate([0, 0, -90]) difference() {
      cube([screwHoleYDistance, screwHoleYDistance, trayHeight + 3]);
      translate([0, 0, -.5]) cylinder(r = screwHoleYDistance, h = trayHeight + 3);
    }
    translate([0, 0, .01]) difference() {
      intersection() {
        difference() {
          cylinder(r = outerRad - wallThickness, h = trayHeight);
          translate([0, 0, -1]) cylinder(r = innerRad + wallThickness, h = trayHeight + 2);
          translate([wallThickness -.01, 0, -.5]) cube([1, outerRad + 1, trayHeight + 1]);
          rotate([0, 0, -8]) translate([0, outerRad - fingerHoleRad - wallThickness, trayHeight - fingerHoleRad - wallThickness]) cube([(fingerHoleRad + wallThickness) * 2, fingerHoleRad + wallThickness, fingerHoleRad + wallThickness]);
          rotate([0, 0, -8]) translate([0, outerRad - fingerHoleRad - wallThickness, trayHeight - fingerHoleRad - wallThickness]) rotate([-45, 0, 0]) cube([(fingerHoleRad + wallThickness) * 2, fingerHoleRad + wallThickness, fingerHoleRad + wallThickness]);
          
          for (r = [90/hDiv:90/hDiv:90-90/hDiv]) {
            rotate([0, 0, -r]) cube([wallThickness, outerRad * 2, height * 2 + 2], center = true);
          }
        }
        translate([wallThickness, wallThickness, wallThickness]) cube([100, 100, trayHeight]);
      }
      translate([outerRad - screwHoleYDistance - wallThickness + .01, screwHoleYDistance + wallThickness - .01, -1.5]) rotate([0, 0, -90]) difference() {
        cube([screwHoleYDistance, screwHoleYDistance, trayHeight + 3]);
        translate([0, 0, -.5]) cylinder(r = screwHoleYDistance, h = trayHeight + 4);
      }
      translate([outerRad - screwHoleXDistance, screwHoleYDistance, -1]) cylinder(r = m3TapRad * 5, h = trayHeight + 2);
      translate([screwHoleYDistance, outerRad - screwHoleXDistance, -1]) cylinder(r = m3TapRad * 5, h = trayHeight + 2);
    }

    difference() {
      rotate([0, 0, -8]) translate([wallThickness, outerRad - fingerHoleRad, trayHeight - fingerHoleRad - 9.9]) cube([fingerHoleRad * 2, fingerHoleRad + 5, fingerHoleRad + 10]);
      rotate([0, 0, -8]) translate([0, outerRad - fingerHoleRad, trayHeight - fingerHoleRad * 3 + .01]) rotate([5, 0, 0]) cube([fingerHoleRad * 3, fingerHoleRad + 10, fingerHoleRad * 2]);
    }
    translate([screwHoleYDistance, outerRad - screwHoleXDistance, 0]) sphere(r = detentRad + .2);
  }
  translate([0, 0, -1]) cube([100, 100, trayHeight + 2]);
}

translate([screwHoleYDistance, outerRad - screwHoleXDistance, trayHeight]) sphere(r = detentRad);
