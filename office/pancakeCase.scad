include <../_constants.scad>

holeLocations = [
  [5, 5, 0, false, false],
  [18, 17, 0, true, true],
  [18, 51, 0, true, true],
  [90, 34, 0, true, true],
  [110, 19, 0, true, true],
  [115, 55, 0, false, true],
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
barThickness = 5;

caseHeight = 10;
holeDepth = 8;

caseAngle = 5;
vertShift = h * sin(caseAngle);

difference() {
  translate([0, 0, -vertShift]) rotate([caseAngle, 0, 0])
  difference() {
    union () {
      for (loc=holeLocations) {
        if(loc[4]) translate([loc.x, loc.y, caseHeight - standoffHeight]) cylinder(r = standoffRad, h = standoffHeight);
      }
      for (i=[0:1:len(holeLocations) - 2]) {
        hull() {
          translate([holeLocations[i].x, holeLocations[i].y, 0]) cylinder(r = barThickness/2, h = caseHeight - standoffHeight);
          translate([holeLocations[i+1].x, holeLocations[i+1].y, 0]) cylinder(r = barThickness/2, h = caseHeight - standoffHeight);
        }
      }
    }
    for (loc=holeLocations) {
      if(loc[3]) translate([loc.x, loc.y, caseHeight - holeDepth + eps]) cylinder(r = holeRad, h = holeDepth);
    }
  } 

  translate([0, 0, -caseHeight]) cube([l, h, caseHeight]);
}