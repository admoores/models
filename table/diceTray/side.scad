include <_common.scad>

edgeLength = totalWidth / 4;
outerEdgeLength = edgeLength * 2;
ri = sqrt(3) / 2 * outerEdgeLength;
sideGap = totalWidth / 2 - ri;

difference() {
  cube([outerEdgeLength, sideGap, height]);
  translate([sideWallThickness, sideWallThickness, sideBaseThickness]) cube([outerEdgeLength - (sideWallThickness * 2), sideGap - (sideWallThickness * 2), height]);

  for(i=[-1, 1]) {
    translate([(edgeLength / 3) * i + outerEdgeLength / 2, sideGap - sideWallThickness / 2 + 20, height / 2]) rotate([90, 0, 0]) {
      translate([0, 0, 19.99]) cylinder(h = 30, r = screwHeadRad);
      cylinder(h = 20, r = screwRad);
    }
  }

  translate([(outerEdgeLength / 7), sideGap / 2, -.1]) rotate([0, 0, 30]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d20.svg", center=true);
  }

  translate([(outerEdgeLength / 7) * 2, sideGap / 2, -.1]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d12.svg", center=true);
  }

  translate([(outerEdgeLength / 7) * 3, sideGap / 2, -.1]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d10.svg", center=true);
  }

  translate([(outerEdgeLength / 7) * 4, sideGap / 2, -.1]) rotate([0, 0, 90]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d8.svg", center=true);
  }

  translate([(outerEdgeLength / 7) * 5, sideGap / 2, -.1]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d6.svg", center=true);
  }

  translate([(outerEdgeLength / 7) * 6, sideGap / 2, -.1]) rotate([0, 0, 90]) linear_extrude(sideBaseThickness + .2) {
    scale([sideDiceLen / diceLen, sideDiceLen / diceLen]) import("dice/d4.svg", center=true);
  }
}