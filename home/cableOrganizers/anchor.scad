include <_common.scad>

difference() {
  union() {
    cube([length - anchorWidth, anchorWidth, wallThickness]);
    translate([0, anchorWidth / 2, 0]) cylinder(r = anchorWidth / 2, h = wallThickness);
    translate([length - anchorWidth, anchorWidth / 2, 0]) cylinder(r = anchorWidth / 2, h = wallThickness);
  }

  translate([0, anchorWidth / 2, -wallThickness]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness * 2, wallThickness / 2);
  translate([length / 2 - anchorWidth / 2, anchorWidth / 2, -wallThickness]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness * 2, wallThickness / 2);
  translate([length - anchorWidth, anchorWidth / 2, -wallThickness]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness * 2, wallThickness / 2);

  translate([anchorWidth / 2, 0, 0]) dovetail(wallThickness * 3 + tolerance, wallThickness + tolerance, wallThickness, loopWidth + tolerance);
  translate([length - anchorWidth * 1.5, 0, 0]) dovetail(wallThickness * 3 + tolerance, wallThickness + tolerance, wallThickness, loopWidth + tolerance);
}