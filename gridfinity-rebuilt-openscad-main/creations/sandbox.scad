include <../gridfinity-rebuilt-utility.scad>
include </home/gouda/repos/models/tabletop/TI4/magnetHexHolder.scad>



module measuringTapeHolder() {
  measuringTapeHolder_height = 3;
  measuringTapeHolder_baseThickness = 0;

  gridfinityInit(1, 2, height(measuringTapeHolder_height), measuringTapeHolder_baseThickness, 42) {
    cut_move(1, 1, 1, 1) {
      translate([0, -5, 20]) rotate([15, 0, 0]) minkowski() {
        cube([20, 50, 50], center=true);
        sphere(r = 2.5);
      }
      translate([0, 30, -1.2 + eps]) rotate([0, 0, 180]) linear_extrude(1.2) text("Measuring", valign="center", halign="center", font=defaultFont, size=4.5);
      translate([0, 36, -1.2 + eps]) rotate([0, 0, 180]) linear_extrude(1.2) text("Tape", valign="center", halign="center", font=defaultFont, size=4.5);
    }
  }

  gridfinityBase(1, 2, 42, 0, 0, 1);
}

module cylinderHoles() {
  cylinderHoles_height = 9;
  cylinderHoles_baseThickness = 0;
  cylinderHoles_numHoles = 4;
  cylinderHoles_holeRad = 6.25;
  cylinderHoles_chamfer = 2.5;
  cylinderHoles_ctrHole = false;
  cylinderHoles_offsetRad = 20;

  gridfinityInit(1, 1, height(cylinderHoles_height), cylinderHoles_baseThickness, 42) {
    cut_move(1, 1, 1, 1) translate([0, 0, -height(cylinderHoles_height)]) {
      for (i=[1:1:cylinderHoles_numHoles]) {
        rotate([0,0,(360/cylinderHoles_numHoles)*i + 45]) {
          translate([cylinderHoles_offsetRad - (cylinderHoles_holeRad + cylinderHoles_chamfer), 0, 0]) {
            translate([0, 0, height(cylinderHoles_height) - cylinderHoles_chamfer]) cylinder(r1 = cylinderHoles_holeRad,r2 = cylinderHoles_holeRad + cylinderHoles_chamfer, h=cylinderHoles_chamfer + eps);
            cylinder(r = cylinderHoles_holeRad, h = height(cylinderHoles_height) + eps);
          } 
        }
      }

      if (cylinderHoles_ctrHole) {
        translate([0, 0, height(cylinderHoles_height) - cylinderHoles_chamfer]) cylinder(r1 = cylinderHoles_holeRad,r2 = cylinderHoles_holeRad + cylinderHoles_chamfer, h=cylinderHoles_chamfer + eps);
         cylinder(r = cylinderHoles_holeRad, h = height(cylinderHoles_height) + eps);
      } 
    }
  }

  gridfinityBase(1, 1, 42, 0, 0, 1);
}

module repeat(nx = 1, ny = 1, ox = 1, oy = 1) {
  for (x=[0:1:nx-1]) {
    for (y=[0:1:ny-1]) {
      translate([x * ox, y * oy, 0]) {
        children();
      }
    }
  }
}

!union() {
  repeat(6, 1, 10, 57.5) {
    rotate([0, 0, 60]) {
      hexHolder();
    }
  }
}

