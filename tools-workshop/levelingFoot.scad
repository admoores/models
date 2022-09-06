include <../modules/hexagon.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

tolerance = .05;

hexMinor = 14.3;
hexMajor = 16.4;
hexDepth = 6.5;

footWidth = 20;

difference() {
  union() {
    cylinder(r1 = footWidth, r2 = footWidth * (5/8), h = hexDepth * 2);
    translate([0, 0, hexDepth]) linear_extrude(hexDepth) hexagon(hexMajor);
  }
  translate([0, 0, hexDepth + 0.01]) linear_extrude(hexDepth) hexagon(r = hexMajor / 2 + tolerance);
}