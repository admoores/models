include <_common.scad>

edgeLength = totalWidth / 4;
outerEdgeLength = edgeLength * 2;
ri = sqrt(3) / 2 * outerEdgeLength;
sideGap = totalWidth / 2 - ri;

difference() {
  cube([75, 75, 5]);
  translate([2, 2, 2]) cube([71, 71, 10]);

  translate([25, 25, -.1]) rotate([0, 0, 180]) linear_extrude(cornerBaseThickness + .2) {
    scale([cornerRuneLen / runeLen, cornerRuneLen / runeLen]) import("runes/rune1.svg", center=true);
  };

  translate([25, 55, -.1]) rotate([0, 0, 180]) linear_extrude(cornerBaseThickness + .2) {
    scale([cornerRuneLen / runeLen, cornerRuneLen / runeLen]) import("runes/rune1.svg", center=true);
  };

  translate([55, 15, -.1]) rotate([0, 0, 90]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d8.svg", center=true);
  }

  translate([55, 30, -.1]) rotate([0, 0, 90]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d20.svg", center=true);
  }

  translate([55, 45, -.1]) rotate([0, 0, 90]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d8.svg", center=true);
  }

  translate([55, 60, -.1]) rotate([0, 0, 90]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d20.svg", center=true);
  }

}