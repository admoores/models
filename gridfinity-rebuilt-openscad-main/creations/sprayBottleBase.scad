include <../gridfinity-rebuilt-utility.scad>

unitHeight = 6;
bottomThickness = 0;

enable_lip = true;

bottleRadius = 6.25;

!union() {
  gridfinityInit(1, 1, height(unitHeight), bottomThickness, 42) {
    cut_move(1, 1, 1, 1) {
      translate([0, 0, -height(unitHeight)]) cylinder(r = bottleRadius, h = height(unitHeight) + .001);
      translate([0, 0, -height(1)]) cylinder(r1 = bottleRadius, r2 = bottleRadius + height(1), h = height(1) + .001);
    }
  }

  gridfinityBase(1, 1, 42, 0, 0, 1);
}

