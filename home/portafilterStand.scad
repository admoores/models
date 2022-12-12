$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

spoutLen = 50;
spoutWidth = 30;
spoutDepth = 30;

footRatio = 1.1;

outerDiam = 60;

coneLift = 8.8;

baseThickness = 10;

handleAngle = 21.9;
handleDiam = 18;

difference() {
  cylinder(r1 = (outerDiam / 2) * footRatio, r2 = outerDiam / 2, h = spoutDepth + baseThickness + coneLift);

  translate([0, 0, baseThickness + spoutDepth + coneLift]) rotate([0, 90, handleAngle]) cylinder(r = handleDiam / 2, h = 100);

  translate([0, 0, spoutDepth + baseThickness]) cylinder(r1 = 0, r2 = outerDiam / 2, h = coneLift);

  translate([-(spoutLen - spoutWidth) / 2, 0, baseThickness]) union() {
    cylinder(r = spoutWidth / 2, h = spoutDepth + coneLift);
    translate([spoutLen - spoutWidth, 0, 0]) cylinder(r = spoutWidth / 2, h = spoutDepth + coneLift);
    translate([0, spoutWidth / -2, 0]) cube([spoutLen - spoutWidth, spoutWidth, spoutDepth + coneLift]);
  }
}