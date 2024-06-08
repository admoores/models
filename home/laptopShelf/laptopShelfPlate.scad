include <_common.scad>


intersection() {
  union() {
    translate([filletRad, 199.99, filletRad]) rotate([90, 0, 0]) linear_extrude(prongLength * 2) {
      offset(filletRad) square([(legWidth + wallThickness * 2) - filletRad * 2, wallThickness]);
    }
  }
  difference() {
    cube([legWidth + wallThickness * 2, bracketHeight, wallThickness]);

    translate([wallThickness / 2, bracketHeight / 4, -.01]) cylinder(r = m3ScrewThruHole, h = wallThickness + .02);
    translate([wallThickness / 2, bracketHeight / 4 * 3, -.01]) cylinder(r = m3ScrewThruHole, h = wallThickness + .02);
    translate([wallThickness / 2 * 3 + legWidth, bracketHeight / 4, -.01]) cylinder(r = m3ScrewThruHole, h = wallThickness + .02);
    translate([wallThickness / 2 * 3 + legWidth, bracketHeight / 4 * 3, -.01]) cylinder(r = m3ScrewThruHole, h = wallThickness + .02);

    #translate([wallThickness / 2, bracketHeight / 4, -.01]) cylinder(r = m3ScrewHead, h = wallThickness / 2 + .02);
    #translate([wallThickness / 2, bracketHeight / 4 * 3, -.01]) cylinder(r = m3ScrewHead, h = wallThickness / 2 + .02);
    #translate([wallThickness / 2 * 3 + legWidth, bracketHeight / 4, -.01]) cylinder(r = m3ScrewHead, h = wallThickness / 2 + .02);
    #translate([wallThickness / 2 * 3 + legWidth, bracketHeight / 4 * 3, -.01]) cylinder(r = m3ScrewHead, h = wallThickness / 2 + .02);
  }
}
