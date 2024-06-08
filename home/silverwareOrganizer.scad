$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

wallThickness = 2.4;

width = 57.5;
height = 65;
minOpeningLen = 240;
length = minOpeningLen + (2 * wallThickness);

alignmentRad = 10;

union() {
  translate([width / 4 * 3, wallThickness, length / 2]) rotate([90, 0, 0]) cylinder(r = alignmentRad, h = wallThickness); 
  difference() {
    cube([width, height, length / 2]);
    translate([wallThickness, wallThickness, wallThickness]) cube([width - wallThickness * 2, height - wallThickness, length - wallThickness]);
    translate([width / 4, wallThickness, length / 2]) rotate([90, 0, 0]) cylinder(r = alignmentRad, h = wallThickness);
    translate([0, height + wallThickness, length / 2 + wallThickness]) rotate([0, 90, 0]) cylinder(h = width, r = height);
  }
}