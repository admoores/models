include <_common.scad>

edgeLength = totalWidth / 4;
outerEdgeLength = edgeLength * 2;
ri = sqrt(3) / 2 * outerEdgeLength;

difference() {
  linear_extrude(1) polygon(points = [
    [edgeLength / -2, 0],
    [edgeLength / 2, 0],
    [edgeLength, ri / 2],
    [-edgeLength, ri / 2]
  ]);

  translate([0, 0, -.05]) linear_extrude(1.1) offset(r = -wallThickness) polygon(points = [
    [edgeLength / -2, 0],
    [edgeLength / 2, 0],
    [edgeLength, ri / 2],
    [-edgeLength, ri / 2]
  ]);
}
