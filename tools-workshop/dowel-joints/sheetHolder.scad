$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

include <_common.scad>

difference() {
  union() {
    rotate([90, 0, 0]) cylinder(h = (insertDepth + offsetDepth), r = holeRad + wallThickness, center = true);
    translate([0, (insertDepth + offsetDepth) / -2, -(holeRad + wallThickness)]) cube([distanceFromWall, insertDepth + offsetDepth, 2 * (holeRad + wallThickness)]);
  }
  translate([distanceFromWall / (3 / 2) - wallThickness, -5, 0]) cube([distanceFromWall / (3 / 2), insertDepth + offsetDepth, 50], center=true);
  rotate([90, 0, 0]) cylinder(h = (insertDepth + offsetDepth) + .2, r = holeRad, center = true);
  translate([-holeRad + wallThickness, 0, 0]) rotate([0, -90, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness + 1, wallThickness / 2);
}