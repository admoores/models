include <_common.scad>

difference() {
  linear_extrude(height) hexagon(r = totalWidth / 4);
  translate([0, 0, baseThickness]) hull() {
    linear_extrude(.01) hexagon(r = totalWidth / 4 - wallThickness);
    translate([0, 0, height + .01 - baseThickness]) linear_extrude(.01) hexagon(r = totalWidth / 4 - wallThickness * (3 / 2));
  }

  rl = sqrt(3) / 2 * (totalWidth / 4);

  for (i=[0:5]) {
    for (j=[-1,1]) {
      rotate([90, 0, 60 * i]) translate([(totalWidth / 24) * j, height / 2, -20 - rl + wallThickness / 2]) {
        translate([0, 0, 19.99]) cylinder(h = 20, r = screwHeadRad);
        cylinder(h = 20, r = screwRad);
      }
    }
  }
}