include <_common.scad>

difference() {
  cube([sideLen, sideLen, dioramaWidth / 2]);
  translate([bottomHeight + wallThickness, backDepth + wallThickness, -.1]) cube([sideLen - bottomHeight + .1, sideLen - backDepth + .1, dioramaWidth / 2 + .2]);
  translate([-.1, -.1, -.1]) cube([bottomHeight + .1, sideLen - wallThickness + .1, dioramaWidth / 2 + .2]);
  translate([bottomHeight + wallThickness + backDepth / 2, backDepth + wallThickness, -.1]) cylinder(r = backDepth / 2, h = ledStripWidth / 2 + .1);
  translate([bottomHeight + wallThickness + backDepth / 2, backDepth / 2 + wallThickness, -.1]) cube([sideLen - bottomHeight - wallThickness - backDepth / 2 + .1, backDepth / 2 + .1, ledStripWidth / 2 + .1]);
}