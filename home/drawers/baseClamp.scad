include <_common.scad>

long = 1;

difference() {
  union() {
    cube([depth / 4, nutRad * 4, wallThickness * 2]);
    translate([0, nutRad * 2, 0]) cylinder(r = nutRad * 2, h = wallThickness * 2);
    translate([depth / 4, nutRad * 2, 0]) cylinder(r = nutRad * 2, h = wallThickness * 2);

    if (long == 1) {
      translate([-depth / 8, 0, 0]) cube([depth / 8, nutRad * 4, wallThickness * 2]);
      translate([-depth / 8, nutRad * 2, 0]) cylinder(r = nutRad * 2, h = wallThickness * 2);

      translate([depth / 4, 0, 0]) cube([depth / 8, nutRad * 4, wallThickness * 2]);
      translate([depth * 3 / 8, nutRad * 2, 0]) cylinder(r = nutRad * 2, h = wallThickness * 2);

    }
  }

  translate([0, nutRad * 2, wallThickness]) linear_extrude(wallThickness + .1) hexagon(r = nutRad);
  translate([depth / 4, nutRad * 2, wallThickness]) linear_extrude(wallThickness + .1) hexagon(r = nutRad);

  translate([0, nutRad * 2, -.5]) cylinder(r = screwRad + tolerance / 2, h = wallThickness + 1);
  translate([depth / 4, nutRad * 2, -.5]) cylinder(r = screwRad + tolerance / 2, h = wallThickness + 1);
}