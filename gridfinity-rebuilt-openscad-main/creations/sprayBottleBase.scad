include <../gridfinity-rebuilt-utility.scad>

unitHeight = 2;
bottomThickness = 0;

enable_lip = false;

bottleRadius = 19;

!union() {
  gridfinityInit(1, 1, height(unitHeight), bottomThickness, 42) {
    cut_move(1, 1, 1, 1) {
      translate([0, 0, -height(unitHeight)]) cylinder(r = bottleRadius, h = height(unitHeight));
      translate([0, 0, -height(1)]) cylinder(r1 = bottleRadius, r2 = bottleRadius + height(1), h = height(1));
    }
  }

  gridfinityBase(1, 1, 42, 0, 0, 1);
}

