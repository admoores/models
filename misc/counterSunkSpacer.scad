include <../modules/chamferedScrew.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // defaul

width = 48;
depth = 29;

wallThickness = 5;
strapThickness = 12.5;

screwHoleDiam = 4.75;
countersinkDiam = 9;

tabLen = 4.5;


difference() {
  cylinder(r = 5, h = 7.5, center = true);
  #translate([0, 0, -6]) rotate([0, 0, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness * 2, wallThickness / 2);
}