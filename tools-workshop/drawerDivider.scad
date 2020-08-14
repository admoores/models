$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

tolerance = .2;
unit = 20;
wallThickness = .8;

wallHeight = 28;

handleHeight = 5;

xUnits = 1;
yUnits = 5;

union() {
  difference() {
    // Body
    difference() {
      cube([tol(xUnits * unit, 2), tol(yUnits * unit, 2), wallHeight]);
      translate([wallThickness, wallThickness, wallThickness * 2]) cube([tol(xUnits * unit - wallThickness * 2, 1), tol(yUnits * unit - wallThickness * 2, 1), wallHeight]);
    }

    // Grid
    for (i = [0:xUnits]) {
      translate([i * unit - tol(wallThickness, -3), 0, 0]) polyhedron(points = [
        [0, 0, 0],
        [tol(wallThickness, -3) * 2, 0, 0],
        [tol(wallThickness, -3), 0, tol(wallThickness, -3)],
        [0, yUnits * unit, 0],
        [tol(wallThickness, -3) * 2, yUnits * unit, 0],
        [tol(wallThickness, -3), yUnits * unit, tol(wallThickness, -3)]
        ], faces = [
          [0, 2, 1],
          [5, 3, 4],
          [2, 5, 4, 1],
          [0, 3, 5, 2],
          [1, 4, 3, 0]
        ], convexity = 10);
    }

    for (j = [0:yUnits]) {
      translate([0, j * unit - tol(wallThickness, -3), 0]) polyhedron(points = [
        [0, 0, 0],
        [0, tol(wallThickness, -3) * 2, 0],
        [0, tol(wallThickness, -3), tol(wallThickness, -3)],
        [xUnits * unit, 0, 0],
        [xUnits * unit, tol(wallThickness, -3) * 2, 0],
        [xUnits * unit, tol(wallThickness, -3), tol(wallThickness, -3)]
        ], faces = [
          [0, 2, 1],
          [5, 3, 4],
          [2, 5, 4, 1],
          [0, 3, 5, 2],
          [1, 4, 3, 0]
        ], convexity = 10);
    }
  }

  // Handle
  translate([0, tol(wallThickness, -1), 0]) difference() {
    translate([(xUnits * unit / 2) - (unit / 4), 0, (wallHeight) - handleHeight]) rotate([45, 0, 0]) cube([unit / 2, handleHeight * 2, handleHeight * 2]);
    translate([-wallThickness, -wallThickness - 1000, -500]) cube([(xUnits * unit) + (2 * wallThickness), 1000, 1000]);
    translate([-100, -100, -1000]) cube([1000, 1000, 1000]);
    translate([-100, -100, wallHeight]) cube([1000, 1000, 1000]);
  }
}


function tol(value, m = 1) = value - (m * tolerance);