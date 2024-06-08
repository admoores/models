include <../modules/fillet.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

spongeThickness = 25;
spongeWidth = 70;

holderDepth = 25;

wallThickness = 5;

difference() {
  cube([spongeThickness + wallThickness * 2, spongeWidth * .75, holderDepth + wallThickness]);
  translate([wallThickness, -spongeWidth * .125, wallThickness + 0.01]) cube([spongeThickness, spongeWidth, holderDepth]);
  translate([wallThickness * 2, spongeWidth * .125, -0.01]) cube([spongeThickness - wallThickness * 2, spongeWidth / 2, wallThickness + 0.03]);
}