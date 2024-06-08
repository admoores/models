include <./_common.scad>;

lidWallThickness = 1;
lidHeight = 10;

difference() {
  cube([totalWidth + lidWallThickness * 2, totalLen + lidWallThickness * 2, lidHeight + lidWallThickness]);
  translate([lidWallThickness, lidWallThickness, lidWallThickness]) cube([totalWidth, totalLen, lidHeight + .01]);
}