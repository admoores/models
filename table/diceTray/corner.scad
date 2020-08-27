include <_common.scad>

edgeLength = totalWidth / 4;
outerEdgeLength = edgeLength * 2;
ri = sqrt(3) / 2 * outerEdgeLength;
sideGap = totalWidth / 2 - ri;

difference() {
  linear_extrude(height) polygon(points = [
    [0, 0],
    [outerEdgeLength, 0],
    [sideGap, outerEdgeLength / 2],
    [0, outerEdgeLength / 2]
  ]);

  translate([0, 0, cornerBaseThickness]) linear_extrude(height) offset(r = -wallThickness) polygon(points = [
    [0, 0],
    [outerEdgeLength, 0],
    [sideGap, outerEdgeLength / 2],
    [0, outerEdgeLength / 2]
  ]);

  rotate([0, 0, -30]) for(i=[-1, 1]) {
    translate([(edgeLength / 3) * i + (outerEdgeLength / 2) - sideGap, (outerEdgeLength / 2) + 20 - wallThickness / 2, height / 2]) rotate([90, 0, 0]) {
      translate([0, 0, 19.99]) cylinder(h = 20, r = screwHeadRad);
      cylinder(h = 20, r = screwRad);
    }
  }

  translate([outerEdgeLength / 2, -20 + wallThickness / 2, height / 2]) rotate([-90, 0, 0]) {
    translate([0, 0, 19.99]) cylinder(h = 20, r = boltHeadRad);
    cylinder(h = 20, r = boltRad);
  }

  translate([-20 + wallThickness / 2, outerEdgeLength / 4, height / 2]) rotate([-90, 0, -90]) {
    translate([0, 0, 19.99]) cylinder(h = 20, r = boltHeadRad);
    cylinder(h = 20, r = boltRad);
  }

  translate([-.1, -.1, cornerBaseThickness]) cube([bracketGap + .1, bracketGap + .1, height]);

  translate([(sqrt(3) / 2) * cornerRuneLen + sideGap, outerEdgeLength / 4 - wallThickness, -.1]) rotate([0, 0, 180]) linear_extrude(cornerBaseThickness + .2) {
    scale([cornerRuneLen / runeLen, cornerRuneLen / runeLen]) import("runes/rune1.svg", center=true);
  };
}