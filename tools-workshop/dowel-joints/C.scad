$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

include <_common.scad>

difference() {
  union() {
    cylinder(h = insertDepth + offsetDepth, r = holeRad + wallThickness);
    rotate([90, 0, 0]) cylinder(h = 2 * (insertDepth + offsetDepth), r = holeRad + wallThickness, center = true);
    rotate([0, -90, 0]) cylinder(h = insertDepth + offsetDepth, r = holeRad + wallThickness);
  }

  translate([0, 0, offsetDepth]) cylinder(h = insertDepth + .01, r = holeRad);
  rotate([90, 0, 0]) cylinder(h = 2 * (insertDepth + offsetDepth) + .2, r = holeRad, center = true);
  rotate([0, -90, 0]) translate([0, 0, offsetDepth]) cylinder(h = insertDepth + .01, r = holeRad);
  translate([-holeRad + wallThickness, 0, (insertDepth + offsetDepth) / (3 / 2)]) rotate([0, -90, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness + 1, wallThickness / 2);
  translate([-holeRad + wallThickness, (insertDepth + offsetDepth) / (3 / -2), 0]) rotate([0, -90, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness + 1, wallThickness / 2);
  translate([-holeRad + wallThickness, (insertDepth + offsetDepth) / (3 / 2), 0]) rotate([0, -90, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness + 1, wallThickness / 2);
  translate([(insertDepth + offsetDepth) / (3 / -2), holeRad - wallThickness, 0]) rotate([-90, 0, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness + 1, wallThickness / 2);
}