include <_common.scad>

union() {
  cylinder(h = cornerBaseThickness, r = cornerRuneLen / 2 + 5);

  translate([0, 0, cornerBaseThickness]) linear_extrude(cornerBaseThickness) {
    offset(r = -runeInternalOffset) scale([cornerRuneLen / runeLen, cornerRuneLen / runeLen]) import("runes/rune1.svg", convexity=10, center=true);
  }
}