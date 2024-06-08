$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

tolerance = .2;
unit = 20;
wallThickness = 1.6;
barWidth = 10;

internalHeight = 32;

handleHeight = 5;

xUnits = 9;
yUnits = 9;

union() {
  difference() {
    cube([tol(xUnits * unit, -2) + wallThickness, tol(yUnits * unit, -2) + 2 * wallThickness, internalHeight + 2 * wallThickness]);
    translate([-.1, wallThickness, wallThickness]) cube([tol(xUnits * unit, -2) + .1, tol(yUnits * unit, -2), internalHeight]);
    translate([barWidth + wallThickness, barWidth, barWidth + wallThickness]) cube([tol(xUnits * unit, -2), tol(yUnits * unit, -2) - 2 * barWidth, internalHeight - 2 * barWidth]);

    // intersection() {
    //   barAngle = atan(xUnits / yUnits);

    //   translate([- .1, barWidth, internalHeight / -2]) cube([tol(xUnits * unit, -2) - barWidth + .1, tol(yUnits * unit, -2) - 2 * barWidth, 2 * internalHeight]);
    //   difference() {
    //     translate([- .1, barWidth, internalHeight / -2]) cube([tol(xUnits * unit, -2) - barWidth + .1, tol(yUnits * unit, -2) - 2 * barWidth, 2 * internalHeight]);
    //     rotate([0, 0, -barAngle]) translate([-barWidth / 2, 0, internalHeight / -2]) cube([barWidth, diag(xUnits * unit, yUnits * unit), 2 * internalHeight]);
    //     translate([tol(xUnits * unit, -2) + wallThickness, 0, 0]) rotate([0, 0, barAngle]) translate([-barWidth / 2, 0, internalHeight / -2]) cube([barWidth, diag(xUnits * unit, yUnits * unit), 2 * internalHeight]);
    //   }
    // }
  }

  translate([barWidth, -wallThickness, 0]) chevron();
  translate([tol(xUnits * unit, -2) - barWidth - diag(barWidth, barWidth), -wallThickness, 0]) chevron();
  translate([barWidth, tol(yUnits * unit, -2) + 3 * wallThickness, 0]) mirror([0, 1, 0]) chevron();
  translate([tol(xUnits * unit, -2) - barWidth - diag(barWidth, barWidth), tol(yUnits * unit, -2) + 3 * wallThickness, 0]) mirror([0, 1, 0]) chevron();
}

module chevron() {
    difference() {
      union() {
        cube([diag(barWidth, barWidth), wallThickness, internalHeight + 2 * wallThickness]);
        translate([0, 0, internalHeight + 2 * wallThickness]) rotate([0, 45, 0]) cube([barWidth, wallThickness, barWidth]);
        polyhedron(points = [
          [diag(barWidth, barWidth), 0, 0],
          [diag(barWidth, barWidth), wallThickness, 0],
          [diag(barWidth, barWidth) + wallThickness, wallThickness, 0],
          [diag(barWidth, barWidth), 0, internalHeight + 2 * wallThickness],
          [diag(barWidth, barWidth), wallThickness, internalHeight + 2 * wallThickness],
          [diag(barWidth, barWidth) + wallThickness, wallThickness, internalHeight + wallThickness]
        ], faces = [
          [0, 2, 1],
          [3, 4, 5],
          [1, 4, 3, 0],
          [2, 5, 4, 1],
          [5, 2, 0, 3]
        ], convexity = 10);
      }
      translate([-tolerance, -.1, 0]) rotate([0, 45, 0]) cube([tol(barWidth, -2), wallThickness + .2, tol(barWidth, -2)]);
    }
}


function tol(value, m = 1) = value - (m * tolerance);

function diag(x, y) = sqrt(x * x + y * y);