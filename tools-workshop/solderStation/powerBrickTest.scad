include <./_common.scad>;

testWallThickness = 2.4;

difference() {
  cube([powerBrickSide + testWallThickness * 2, powerBrickLen + testWallThickness, powerBrickSide + testWallThickness * 2]);
  translate([testWallThickness, -.01, testWallThickness]) cube([powerBrickSide, powerBrickLen + .01, powerBrickSide]);
  #translate([powerBrickSide / 2 + testWallThickness, powerBrickSide, powerBrickSide / 2 + testWallThickness]) rotate([90, 0, 0]) cylinder(r = powerBrickPlugRad, h = 3 * testWallThickness, center=true);
}