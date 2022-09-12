include <_common.scad>

difference() {
  cube([edgeLen + edgeWidth, edgeWidth + wallThickness * 3 + acrylicThickness, woodThickness + wallThickness * 2]);
  translate([edgeLen, wallThickness * 3 + acrylicThickness, -.5]) rotate([0, 0, -45]) cube([edgeWidth * 2, edgeWidth, woodThickness + wallThickness * 2 + 1]);
  translate([edgeLen, wallThickness * 3 + acrylicThickness, -.5]) rotate([0, 0, 45]) cube([edgeWidth, edgeWidth * 2, woodThickness + wallThickness * 2 + 1]);
  translate([edgeLen, wallThickness * 3 + acrylicThickness, -.5]) cube([edgeWidth + .1, edgeWidth + .1, woodThickness + wallThickness * 2 + 1]);
  translate([-.5, wallThickness * 3 + acrylicThickness, wallThickness]) cube([edgeLen + 1, edgeWidth + wallThickness + .1, woodThickness]);
  translate([-.5, wallThickness, wallThickness]) cube([edgeLen + edgeWidth + 1, acrylicThickness, woodThickness + wallThickness + .1]);
}