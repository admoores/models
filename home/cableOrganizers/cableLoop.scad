include <_common.scad>

difference() {
  baseShape();
  translate([wallThickness, wallThickness + 0.01, -.1]) resize([loopLength - wallThickness * 2, loopDepth - wallThickness, loopWidth + .2]) baseShape();
}

translate([wallThickness / 2, loopDepth, 0]) rotate([90, 0, 0]) dovetail(wallThickness * 3, wallThickness, wallThickness, loopWidth);
translate([loopLength - wallThickness / 2, loopDepth, 0]) rotate([90, 0, 0]) dovetail(wallThickness * 3, wallThickness, wallThickness, loopWidth);

module baseShape() {
  difference() {
    cube([loopLength, loopDepth, loopWidth]);
    translate([wallThickness - 0.01, wallThickness - 0.01, -0.1]) rotate([0, 0, 180]) fillet(r = wallThickness, l = loopWidth + 0.2);
    translate([loopLength - wallThickness + 0.01, wallThickness - 0.01, -0.1]) rotate([0, 0, -90]) fillet(r = wallThickness, l = loopWidth + 0.2);
  }
}