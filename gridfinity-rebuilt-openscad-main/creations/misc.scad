include <../gridfinity-rebuilt-bins.scad>

unitHeight = 9;
bottomThickness = 0;

enable_lip = true;

holeRadius = 6;

!union() {
  gridfinityInit(1, 1, height(unitHeight), bottomThickness, 42) {
    cut_move(0, 0, 1, 1) {
      rotate([0, 0, 45]) pattern_circular(4) {
        translate([holeRadius * 2, 0, 0]) cylinder(r = holeRadius, h = 1000, center=true);
        translate([holeRadius * 2, 0, -height(1) / 2 + .001]) cylinder(r1 = holeRadius, r2 = holeRadius + height(1), h = height(1), center=true);
      }
    }
  }

  gridfinityBase(1, 1, 42, 0, 0, 1);
}

