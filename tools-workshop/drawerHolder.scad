$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

tolerance = .2;
unit = 20;
wallThickness = 1.6;
drawerWallThickness = .8;
barWidth = 10;

internalHeight = 32;

handleHeight = 5;

xUnits = 9;
yUnits = 9;

interiorXDimension = tol(xUnits * unit + drawerWallThickness * 2, -2);
interiorYDimension = tol(yUnits * unit + drawerWallThickness * 2, -2);

exteriorXDimension = interiorXDimension + wallThickness;
exteriorYDimension = interiorYDimension + wallThickness * 2;

union() {
  difference() {
    union() {
      cube([exteriorXDimension, exteriorYDimension, internalHeight + 2 * wallThickness]);
      translate([0, -wallThickness, 0]) cube([barWidth * 2, exteriorYDimension + 2 * wallThickness, diag(barWidth, barWidth) / 3 * 2]);
      translate([exteriorXDimension - barWidth * 2, -wallThickness, 0]) cube([barWidth * 2, exteriorYDimension + 2 * wallThickness, diag(barWidth, barWidth) / 3 * 2]);
    }
    translate([-.1, wallThickness, wallThickness]) cube([interiorXDimension + .1, interiorYDimension, internalHeight + 2 * wallThickness]);

    translate([0, -.1, 0]) rotate([0, 45, 0]) cube([tol(barWidth, -2), wallThickness + .1, tol(barWidth, -2)]);
    translate([exteriorXDimension - diag(tol(barWidth, -2), tol(barWidth, -2)), -.1, 0]) rotate([0, 45, 0]) cube([tol(barWidth, -2), wallThickness + .1, tol(barWidth, -2)]);
    translate([0, exteriorYDimension - wallThickness, 0]) rotate([0, 45, 0]) cube([tol(barWidth, -2), wallThickness + .1, tol(barWidth, -2)]);
    translate([exteriorXDimension - diag(tol(barWidth, -2), tol(barWidth, -2)) + .1, exteriorYDimension - wallThickness, 0]) rotate([0, 45, 0]) cube([tol(barWidth, -2), wallThickness + .1, tol(barWidth, -2)]);

    intersection() {
      barAngle = atan(xUnits / yUnits);

      translate([- .1, barWidth + wallThickness, internalHeight / -2]) cube([interiorXDimension - barWidth + .1, interiorYDimension - 2 * barWidth, 2 * internalHeight]);
      difference() {
        translate([- .1, barWidth + wallThickness, internalHeight / -2]) cube([interiorXDimension - barWidth + .1, interiorYDimension - 2 * barWidth, 2 * internalHeight]);
        rotate([0, 0, -barAngle]) translate([-barWidth / 2, 0, internalHeight / -2]) cube([barWidth, diag(interiorXDimension, interiorYDimension), 2 * internalHeight]);
        translate([exteriorXDimension, 0, 0]) rotate([0, 0, barAngle]) translate([-barWidth / 2, 0, internalHeight / -2]) cube([barWidth, diag(interiorXDimension, interiorYDimension), 2 * internalHeight]);
      }
    }
  }

  translate([0, 0, internalHeight + 2 * wallThickness]) rotate([0, 45, 0]) cube([barWidth, wallThickness, barWidth]);
  translate([exteriorXDimension - diag(barWidth, barWidth), 0, internalHeight + 2 * wallThickness]) rotate([0, 45, 0]) cube([barWidth, wallThickness, barWidth]);
  translate([0, exteriorYDimension - wallThickness, internalHeight + 2 * wallThickness]) rotate([0, 45, 0]) cube([barWidth, wallThickness, barWidth]);
  translate([exteriorXDimension - diag(barWidth, barWidth), exteriorYDimension - wallThickness, internalHeight + 2 * wallThickness]) rotate([0, 45, 0]) cube([barWidth, wallThickness, barWidth]);
}


function tol(value, m = 1) = value - (m * tolerance);

function diag(x, y) = sqrt(x * x + y * y);