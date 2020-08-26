include <_common.scad>

edgeLength = totalWidth / 4;
outerEdgeLength = edgeLength * 2;
ri = sqrt(3) / 2 * outerEdgeLength;
offsetDistance = sqrt(pow(wallThickness, 2) / 2);

difference() {
  linear_extrude(height) polygon(points = [
    [edgeLength / -2, 0],
    [edgeLength / 2, 0],
    [edgeLength, ri / 2],
    [-edgeLength, ri / 2]
  ]);

  hull() {
    translate([0, 0, baseThickness]) linear_extrude(.01) offset(r = -wallThickness * 3) polygon(points = [
      [edgeLength / -2, 0],
      [edgeLength / 2, 0],
      [edgeLength, ri / 2],
      [-edgeLength, ri / 2]
    ]);

    translate([0, 0, height + .01]) linear_extrude(.01) offset(r = -wallThickness) polygon(points = [
      [edgeLength / -2, 0],
      [edgeLength / 2, 0],
      [edgeLength, ri / 2],
      [-edgeLength, ri / 2]
    ]);
  }

  for(i=[-1, 1]) {
    translate([(edgeLength / 6) * i, -20 + wallThickness / 2, height / 2]) rotate([-90, 0, 0]) {
      translate([0, 0, 19.99]) linear_extrude(20) hexagon(r = nutRad);
      cylinder(h = 20, r = screwRad);
    }
  }

  for(i=[-1, 1]) {
    translate([(edgeLength / 3) * i, (ri / 2) + 20 - wallThickness / 2, height / 2]) rotate([90, 0, 0]) {
      translate([0, 0, 19.99]) linear_extrude(20) hexagon(r = nutRad);
      cylinder(h = 20, r = screwRad);
    }
  }
}