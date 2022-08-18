include <_common.scad>

difference() {
  baseShape();
  translate([wallThickness, -wallThickness, wallThickness]) resize([width - wallThickness * 2, depth, height - wallThickness * 2]) baseShape();
  translate([wallThickness * 3, 0, wallThickness * 3]) resize([width - wallThickness * 6, depth, height - wallThickness * 6]) baseShape();

  for(i = [0:1:unitsWide - 1]) {
    translate([unit / 2 + unit * i, depth / 4, 0]) sphere(r = sphereDetentRad);
    translate([unit / 2 + unit * i, depth / 2, 0]) sphere(r = sphereDetentRad);
    translate([unit / 2 + unit * i, depth / 4 * 3, 0]) sphere(r = sphereDetentRad);
  }
}

for(i = [0:1:unitsWide - 1]) {
  translate([unit / 2 + unit * i, depth / 4, height]) sphere(r = sphereDetentRad - tolerance / 2);
  translate([unit / 2 + unit * i, depth / 2, height]) sphere(r = sphereDetentRad - tolerance / 2);
  translate([unit / 2 + unit * i, depth / 4 * 3, height]) sphere(r = sphereDetentRad - tolerance / 2);
}