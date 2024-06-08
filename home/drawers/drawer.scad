include <_common.scad>

difference() {
  resize([width - wallThickness * 2 - tolerance * 2, depth - wallThickness - tolerance, height - wallThickness * 2 - tolerance * 2]) baseShape();
  translate([wallThickness, wallThickness, wallThickness]) resize([width - wallThickness * 4 - tolerance * 2, depth - wallThickness * 3 - tolerance, height - wallThickness * 4 - tolerance * 2]) baseShape();
  translate([0, wallThickness, height - filletRad * 2 - wallThickness * 2]) cube([width - wallThickness * 2, depth - wallThickness * 3 - tolerance, filletRad * 2]);

  translate([(width - wallThickness * 2 - tolerance * 2) / 2, wallThickness, (height - wallThickness * 2 - tolerance * 2) / 2]) rotate([90, 0, 0]) cylinder(r = screwRad + tolerance / 2, h = wallThickness);
}

translate([wallThickness / 2, wallThickness, height - filletRad * 2 - wallThickness * 2]) rotate([-90, 0, 0]) cylinder(r = wallThickness / 2, h =  depth - wallThickness * 3 - tolerance);
translate([width - wallThickness * 2.5 - tolerance * 2, wallThickness, height - filletRad * 2 - wallThickness * 2]) rotate([-90, 0, 0]) cylinder(r = wallThickness / 2, h =  depth - wallThickness * 3 - tolerance);