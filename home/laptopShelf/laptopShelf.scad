include <_common.scad>

intersection() {
  union() {
    translate([0, 0, filletRad]) cube([legWidth + wallThickness * 2, bracketHeight, legThickness + wallThickness - filletRad]);
    translate([filletRad, 199.99, filletRad]) rotate([90, 0, 0]) linear_extrude(prongLength * 2) {
      offset(filletRad) square([(legWidth + wallThickness * 5 + laptopGap * 3 + laptopThickness + remarkableThickness + ipadThickness) - filletRad * 2, (legThickness + wallThickness) - filletRad * 2]);
    }
  }

  difference() {
    union() {
      cube([legWidth + wallThickness * 2, bracketHeight, legThickness + wallThickness]);
      translate([legWidth + wallThickness, 0, 0]) cube([wallThickness * 4 + laptopGap * 3 + laptopThickness + ipadThickness + remarkableThickness, prongLength, legThickness + wallThickness]);
      translate([legWidth + wallThickness, prongLength, (legThickness + wallThickness) / 2]) rotate([0, 90, 0]) cylinder(r = (legThickness + wallThickness) / 2, h = wallThickness * 4 + laptopGap * 3 + laptopThickness + ipadThickness + remarkableThickness);
    }
    translate([legWidth + wallThickness * 2, 0, -40]) rotate([-(90 - legGroundAngle), 0, 0]) cube([laptopThickness + laptopGap, 100, 100]);
    translate([legWidth + wallThickness * 3 + laptopThickness + laptopGap, 0, -40]) rotate([-(90 - legGroundAngle), 0, 0]) cube([ipadThickness + laptopGap, 100, 100]);
    translate([legWidth + wallThickness * 4 + laptopThickness + ipadThickness + laptopGap * 2, 0, -40]) rotate([-(90 - legGroundAngle), 0, 0]) cube([remarkableThickness + laptopGap, 100, 100]);

    translate([wallThickness / 2, bracketHeight / 4, wallThickness + .01]) cylinder(r = m3ScrewHole, h = legThickness);
    translate([wallThickness / 2, bracketHeight / 4 * 3, wallThickness + .01]) cylinder(r = m3ScrewHole, h = legThickness);
    translate([wallThickness / 2 * 3 + legWidth, bracketHeight / 4, wallThickness + .01]) cylinder(r = m3ScrewHole, h = legThickness);
    translate([wallThickness / 2 * 3 + legWidth, bracketHeight / 4 * 3, wallThickness + .01]) cylinder(r = m3ScrewHole, h = legThickness);

    translate([wallThickness, -.01, wallThickness]) cube([legWidth, bracketHeight + .02, legThickness + .01]);
  }
}