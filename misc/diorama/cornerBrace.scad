include <_common.scad>

difference() {
  intersection() {
    sphere(r = edgeWidth);
    cube([edgeWidth, edgeWidth, edgeWidth]);
  }

  #translate([edgeWidth / 2, edgeWidth / 2, -.1]) cylinder(r = m3ScrewHoleRad, h = edgeWidth / 2);
}