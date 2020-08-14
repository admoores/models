$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

tolerance = .1;
unit = 20;
wallThickness = .8;

wallHeight = 30;

handleHeight = 10;

xUnits = 9;
yUnits = 9;

union() {
  // Base
  difference() {
    cube([xUnits * unit, yUnits * unit, wallThickness]);
    for (x = [0:xUnits - 1]) {
      for (y = [0:yUnits - 1]) {
        translate([x * unit + unit / 6, y * unit + unit / 6, -wallThickness]) cube([unit * 2 / 3, unit * 2 / 3, wallThickness * 3]);
      }
    }
  }

  // Grid
  for (i = [0:xUnits]) {
    translate([i * unit - wallThickness, 0, wallThickness]) polyhedron(points = [
      [0, 0, 0],
      [wallThickness * 2, 0, 0],
      [wallThickness, 0, wallThickness],
      [0, yUnits * unit, 0],
      [wallThickness * 2, yUnits * unit, 0],
      [wallThickness, yUnits * unit, wallThickness]
      ], faces = [
        [0, 2, 1],
        [5, 3, 4],
        [2, 5, 4, 1],
        [0, 3, 5, 2],
        [1, 4, 3, 0]
      ], convexity = 10);
  }

  for (j = [0:yUnits]) {
    translate([0, j * unit - wallThickness, wallThickness]) polyhedron(points = [
      [0, 0, 0],
      [0, wallThickness * 2, 0],
      [0, wallThickness, wallThickness],
      [xUnits * unit, 0, 0],
      [xUnits * unit, wallThickness * 2, 0],
      [xUnits * unit, wallThickness, wallThickness]
      ], faces = [
        [0, 2, 1],
        [5, 3, 4],
        [2, 5, 4, 1],
        [0, 3, 5, 2],
        [1, 4, 3, 0]
      ], convexity = 10);
  }

  // Walls
  translate([-wallThickness, 0, 0]) cube([wallThickness, yUnits * unit, wallHeight + wallThickness]);
  translate([xUnits * unit, 0, 0]) cube([wallThickness, yUnits * unit, wallHeight + wallThickness]);
  translate([-wallThickness, -wallThickness, 0]) cube([(xUnits * unit) + (2 * wallThickness), wallThickness, wallHeight + wallThickness]);
  translate([-wallThickness, yUnits * unit, 0]) cube([(xUnits * unit) + (2 * wallThickness), wallThickness, wallHeight + wallThickness]);

  // Handle
  difference() {
    translate([(xUnits * unit / 2) - (unit / 2), 0, (wallHeight + wallThickness) - handleHeight]) rotate([45, 0, 0]) cube([unit, handleHeight * 2, handleHeight * 2]);
    translate([(xUnits * unit / 2) - (unit / 2) + wallThickness, 0, (wallHeight + 2 * wallThickness) - handleHeight]) rotate([45, 0, 0]) cube([unit - (2 * wallThickness), handleHeight * 2, handleHeight * 2]);
    translate([-wallThickness, -wallThickness, -500]) cube([(xUnits * unit) + (2 * wallThickness), 1000, 1000]);
    translate([-100, -100, -1000]) cube([1000, 1000, 1000]);
    translate([-100, -100, wallHeight + wallThickness]) cube([1000, 1000, 1000]);
  }
}