include <../../_constants.scad>

outerRadius = 57.5 / 2;
innerRadius = 44 / 2;

height = 25;

gapWidth = 5.5;
gapDepth = 3;

screwRad = .925;
screwHead = 3;

difference() {
  intersection() {
    union() {
      cylinder(r = outerRadius, h = height, center = true);
      translate([0, 0, gapDepth / 2]) cube([gapWidth, outerRadius * 2, height + gapDepth], center = true);
      // translate([0, 0, -5]) cube([outerRadius * 2, 10, height], center = true);
      translate([0, 0, 5]) cylinder(r = innerRadius - 2.5, h = height, center = true);
      
    }
    cylinder(r = outerRadius, h = 100, center = true);
  }

  cylinder(r = innerRadius - 5, h = height * 2, center = true);
  translate([0, 0, -5]) rotate([0, 90, 65]) cylinder(r = 4, h = 100, center = true);
  translate([0, 0, -5]) rotate([0, 90, -65]) cylinder(r = 4, h = 100, center = true);

  for(shiftX=[outerRadius - (outerRadius - innerRadius), -(outerRadius - (outerRadius - innerRadius))]) translate([0, shiftX, 0]) {
    cylinder(r = screwRad, h = height * 2, center = true);
    translate([0, 0, -height]) cylinder(r = screwHead, h = height * 2, center = true);
  }
}