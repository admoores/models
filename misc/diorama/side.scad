include <_common.scad>

difference() {
  cube([sideLen, sideLen, dioramaWidth / 2]);
  translate([bottomHeight + wallThickness, backDepth + wallThickness, -.1]) cube([sideLen - bottomHeight + .1, sideLen - backDepth + .1, dioramaWidth / 2 + .2]);
  translate([-.1, -.1, -.1]) cube([bottomHeight + .1, sideLen - wallThickness - frontDepth + .1, dioramaWidth / 2 + .2]);

  // LED Strip Cutout
  translate([bottomHeight + wallThickness + backDepth / 2, backDepth + wallThickness, -.1]) cylinder(r = backDepth / 2, h = ledStripWidth / 2 + .1);
  translate([bottomHeight + wallThickness + backDepth / 2, backDepth / 2 + wallThickness, -.1]) cube([sideLen - bottomHeight - wallThickness - backDepth / 2 + .1, backDepth / 2 + .1, ledStripWidth / 2 + .1]);

  // Wiring cutout
  translate([bottomHeight - .1, -.1, -.1]) cube([sideLen - bottomHeight + .2, backDepth / 2 + .1, wiringCutoutHeight / 2 - (backDepth / 2) + .1]);
  translate([bottomHeight - .1, 0, wiringCutoutHeight / 2 - backDepth / 2]) rotate([0, 90, 0]) cylinder(r = backDepth / 2, h = sideLen - bottomHeight + .2);
  translate([sideLen, backDepth / 2 + wallThickness + .1, 0]) rotate([90, 0, 0]) cylinder(r = ledStripWidth / 2, h = wallThickness + .2);

  for (i = [1:1:3]) {
    translate([bottomHeight + wallThickness + (sideLen - bottomHeight - wallThickness) * i/4, backDepth / 2, dioramaWidth / 2 - screwDepth]) cylinder(r = m3ScrewHoleRad, h = screwDepth + .1);
  }

  for (i = [1:1:2]) {
    translate([bottomHeight * i/3, sideLen - (frontDepth + wallThickness) / 2, dioramaWidth / 2 - screwDepth]) cylinder(r = m3ScrewHoleRad, h = screwDepth + .1);
  }
}

translate([bottomHeight + (sideLen - bottomHeight) / 4, backDepth / 2, 0]) m3Tab();
translate([bottomHeight + (sideLen - bottomHeight) / 4 * 3, backDepth / 2, 0]) m3Tab();

translate([bottomHeight, backDepth + wallThickness + (sideLen - backDepth - frontDepth - wallThickness * 2) / 10, 0]) rotate([0, 0, -90]) m3Tab();
translate([bottomHeight, backDepth + wallThickness + (sideLen - backDepth - frontDepth - wallThickness * 2) / 10 * 9, 0]) rotate([0, 0, -90]) m3Tab();
// translate([bottomHeight, backDepth + wallThickness + (sideLen - backDepth - frontDepth - wallThickness * 2) / 4 * 3, 0]) rotate([0, 0, -90]) m3Tab();

translate([bottomHeight / 2, sideLen - frontDepth - wallThickness, 0]) m3Tab();

translate([sideLen - acrylicThickness - wallThickness, topShelfLen - (edgeWidth + wallThickness) / 2, 0]) intersection() {
  rotate([0, 0, -90]) m3Tab();
  translate([-tabLen, -tabWidth / 2 + (tabWidth - edgeWidth - wallThickness) / 2, 0]) cube([tabLen, edgeWidth + wallThickness, tabThickness]);
}

translate([bottomHeight, sideLen - wallThickness * 2 - acrylicThickness, 0]) difference() {
  cube([edgeWidth + wallThickness, acrylicThickness + wallThickness * 2, dioramaWidth / 2]);
  translate([wallThickness, wallThickness, -.1]) cube([edgeWidth + .1, acrylicThickness, dioramaWidth + .2]);
}

// support for LED channel
translate([bottomHeight + wallThickness + backDepth / 2 + breakawayDistance, backDepth / 2 + wallThickness + breakawayDistance, 0]) cube([sideLen - bottomHeight - wallThickness - backDepth / 2 - breakawayDistance * 2, backDepth / 2 - breakawayDistance, ledStripWidth / 2 - breakawayDistance]);

// Top Shelf
translate([sideLen, 0, 0]) union() {
  difference() {
    cube([topShelfThickness, topShelfLen - topShelfThickness, dioramaWidth / 2 + woodThickness]);
    translate([.1, topShelfLen - miniBaseRad * 2 - edgeWidth + wallThickness, -.1]) cube([topShelfThickness + .2, miniBaseRad * 2 - wallThickness * 2, reedSwitchWidth / 2 + .1]);
    translate([-wallThickness, backDepth / 2 -.1, 0]) rotate([-90, 0, 0]) cylinder(r = ledStripWidth / 2, h = topShelfLen - edgeWidth - wallThickness - backDepth / 2 + .1);
  }

  translate([0, topShelfLen - miniBaseRad * 2 - edgeWidth + wallThickness + breakawayDistance, 0]) cube([topShelfThickness, miniBaseRad * 2 - wallThickness * 2 - breakawayDistance * 2, reedSwitchWidth / 2 - breakawayDistance]);

  translate([0, topShelfLen - topShelfThickness]) intersection() {
    cylinder(r = topShelfThickness, h = dioramaWidth / 2 + woodThickness);
    cube([topShelfThickness, topShelfThickness, dioramaWidth / 2 + woodThickness]);
  }
  translate([-acrylicThickness - wallThickness, topShelfLen - wallThickness - edgeWidth, 0]) difference() {
    cube([wallThickness + acrylicThickness, wallThickness + edgeWidth, dioramaWidth / 2]);
    translate([wallThickness, wallThickness, -.1]) cube([acrylicThickness, edgeWidth + .1, dioramaWidth / 2 + .2]);
  }
  translate([topShelfThickness, topShelfLen - miniBaseRad - edgeWidth, 0]) rotate([-90, 0, -90]) difference() {
    cylinder(r1 = miniBaseRad + wallThickness * 2, r2 = miniBaseRad + wallThickness, h = wallThickness);
    translate([0, 0, -.1]) cylinder(r = miniBaseRad, h = wallThickness + .2);
    translate([-miniBaseRad - wallThickness * 2 - .1, 0, -.1]) cube([(miniBaseRad + wallThickness * 2) * 2 + .2, miniBaseRad + wallThickness * 2 + .1, wallThickness + .2]);
  }
}

module m3Tab() {
  translate([tabWidth / -2, -tabLen, 0]) difference() {
    cube([tabWidth, tabLen, tabThickness]);
    translate([-tabLen / 2, 0, -.1]) cylinder(r = tabLen, h = tabThickness + .2);
    translate([tabWidth + tabLen / 2, 0, -.1]) cylinder(r = tabLen, h = tabThickness + .2);
    translate([tabWidth / 2, tabLen / 2, tabThickness / 2]) cylinder(r=m3LooseScrewHoleRad, h=tabThickness + .2, center=true);
  }
}
