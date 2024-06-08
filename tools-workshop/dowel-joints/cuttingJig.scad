$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm
include <_common.scad>

holeRadPlus = holeRad + .2;

difference() {
  union() {
    cube([50, 50, 10], center=true);
    translate([0, 0, (holeRadPlus + wallThickness) / 2]) cube([50, (holeRadPlus + wallThickness) * 2, 10 + (holeRadPlus + wallThickness)], center=true);
    translate([0, 0, holeRadPlus + wallThickness + 5]) rotate([0, 90, 0]) cylinder(h = 50, r = (holeRadPlus + wallThickness), center=true);
  }

  translate([0, 0, 29]) cube([1, 51, 50], center=true);
  translate([0, 0, holeRadPlus + wallThickness + 5]) rotate([0, 90, 0]) cylinder(h = 50.2, r = holeRadPlus, center=true);
}