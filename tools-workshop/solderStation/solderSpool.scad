$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

widestRad = 15;
narrowestRad = 10;
height = 30;
shoulderHeight = tan(45) * (widestRad - narrowestRad);

solderRad = .5;

difference() {
  union() {
    cylinder(r = narrowestRad, h = height, center=true);
    translate([0, 0, height / -2]) {
      translate([0, 0, shoulderHeight / 2]) cylinder(r1 = widestRad, r2 = narrowestRad, h = shoulderHeight, center=true);
      translate([0, 0, height - shoulderHeight / 2]) cylinder(r2 = widestRad, r1 = narrowestRad, h = shoulderHeight, center=true);
    }
  }
  rotate([90, 0, 0]) cylinder(r = solderRad, h = widestRad * 2, center=true);
  for (i = [0:45:360]) {
    rotate([0, 0, i]) translate([narrowestRad + shoulderHeight / 2, 0, 0]) cylinder(r = solderRad * 2, h = height + .02, center=true);
  }
}