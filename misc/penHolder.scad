$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

width = 70;
rad = 60;
thickness = 1.2;
height = 70;
wingHeight = 25;
wingDepth = 45;
wingWidth = 30;
magRad = 5.15;
magDepth = 2.6;

module baseCenterShape() {
  intersection() {
    circle(r=rad);
    translate([-width / 2, 0]) square([width, rad + .1]);
  }
}

module baseWingShape() {
  translate([(width / 2) - thickness, 0]) square([wingWidth, wingDepth]);
}

module magnetHole(x, y, z) {
  translate([x, y, z]) rotate([90, 0, 0]) cylinder(r = magRad, h = magDepth);
}

difference() {
  union() {
    linear_extrude(thickness) {
      baseCenterShape();
      baseWingShape();
      mirror([1, 0, 0]) baseWingShape();
    }

    linear_extrude(height) {
      translate([-(width / 2), -magDepth * 2]) square([width, magDepth * 2]);
      difference() {
        baseCenterShape();
        offset(r = -thickness, chamfer = true) baseCenterShape();
      }
    }

    linear_extrude(wingHeight) {
      translate([-(width / 2 + wingWidth) + thickness, -magDepth * 2]) square([(width + wingWidth * 2) - (thickness * 2), magDepth * 2]);
      difference() {
        union() {
          baseWingShape();
          mirror([1, 0, 0]) baseWingShape();
        }
        offset(r = -thickness, chamfer = true) {
          baseWingShape();
          mirror([1, 0, 0]) baseWingShape();
        }
      }
    }
  }

  union() {
    for (j = [0, 1]) {
      mirror([j, 0, 0]) {
        numHolesVert = 3;
        for (i = [1:numHolesVert]) {
          magnetHole(0, -magDepth - .1, i * (height / (numHolesVert + 1)));
        }
        numHolesSide = 2;
        for (i = [1:numHolesSide]) {
          magnetHole(-width / 4, -magDepth - .1, i * (height / (numHolesSide + 1)));
        }
        magnetHole(-(width / 2) - (wingWidth / 2), -magDepth - .1, wingHeight / 2);
      }
    }
  }
}
