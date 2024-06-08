include <_common.scad>


difference() {
  union() {
    cube([depth, wallThickness * 2, unit]);

    translate([depth / 4, wallThickness * 2, unit / 2]) sphere(r = sphereDetentRad - tolerance / 2);
    translate([depth / 2, wallThickness * 2, unit / 2]) sphere(r = sphereDetentRad - tolerance / 2);
    translate([depth / 4 * 3, wallThickness * 2, unit / 2]) sphere(r = sphereDetentRad - tolerance / 2);
  }

  translate([depth / 8 * 3, wallThickness * 2 + .1, unit / 2]) rotate([90, 0, 0]) cylinder(r = screwHeadRad + tolerance, h = wallThickness + .1, center = false);
  translate([depth / 8 * 5, wallThickness * 2 + .1, unit / 2]) rotate([90, 0, 0]) cylinder(r = screwHeadRad + tolerance, h = wallThickness + .1, center = false);

  translate([depth / 8 * 3, 0, unit / 2]) rotate([90, 0, 0]) cylinder(r = screwRad + tolerance / 2, h = wallThickness * 3, center = true);
  translate([depth / 8 * 5, 0, unit / 2]) rotate([90, 0, 0]) cylinder(r = screwRad + tolerance / 2, h = wallThickness * 3, center = true);

  cutoutOffset = 4;
  translate([0, wallThickness * 2.5, 0]) rotate([90, 0, 0]) linear_extrude(wallThickness * 3) {
    cutoutWidth = (unit - cutoutOffset * 4) / 2;

    polygon([[cutoutOffset, 0], [depth - cutoutOffset, 0], [depth - cutoutOffset - cutoutWidth, cutoutWidth], [cutoutOffset + cutoutWidth, cutoutWidth]]);
    polygon([[cutoutOffset, unit], [depth - cutoutOffset, unit], [depth - cutoutOffset - cutoutWidth, unit - cutoutWidth], [cutoutOffset + cutoutWidth, unit - cutoutWidth]]);
  }
}
