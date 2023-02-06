include <../_constants.scad>

holeLocations = [
  [18, 17],
  [18, 51],
  [90, 34],
  [110, 19],
  // [216, 17],
  // [216, 51],
  // [144, 34],
  // [124, 19],
];

l = 234;
h = 68;

holeRad = 1;
standoffRad = 2;
standoffHeight = 2;
barThickness = 7.5;

caseHeight = 10;
holeDepth = 8;

caseAngle = 5;

difference() {
  union () {
    for (loc=holeLocations) {
      translate([loc.x, loc.y, caseHeight - standoffHeight]) cylinder(r = standoffRad, h = standoffHeight);
    }
    for (i=[0:1:2]) {
      hull() {
        translate([holeLocations[i].x, holeLocations[i].y, 0]) cylinder(r = barThickness/2, h = caseHeight - standoffHeight);
        translate([holeLocations[i+1].x, holeLocations[i+1].y, 0]) cylinder(r = barThickness/2, h = caseHeight - standoffHeight);
      }
    }
  }
  for (loc=holeLocations) {
    translate([loc.x, loc.y, caseHeight - holeDepth + eps]) cylinder(r = holeRad, h = holeDepth);
  }

  translate([l/2, h, -caseHeight]) rotate([caseAngle, 0, 180]) cube([l/2, h, caseHeight]);
}