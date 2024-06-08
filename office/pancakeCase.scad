include <../_constants.scad>

version = 1; // [0: Wireframe, 1: Half Block]

holeLocations = [
  [5, 5, 0, true, false],
  [5, 64, 0, true, false],
  [100, 5, 0, true, false],
  [80, 64, 0, true, false],
  [18, 17, 0, true, true],
  [18, 51, 0, true, true],
  [90, 34, 0, true, true],
  [110, 19, 0, true, true],
  // [115, 55, 0, false, true],
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

caseHeight = 5;
holeDepth = 8;

keyboardWidth = 68;
perimeterGap = 1;
perimeterWidth = 3;
perimeterHeight = 5;

caseAngle = 5;
vertShift = h * sin(caseAngle);

if (version == 0) {
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
} if (version == 1) {
  halfCaseLen = 112.5;

  difference() {
    translate([0, 0, -vertShift + caseHeight])
    difference() {
      union () {
        for (loc=holeLocations) {
          if(loc[4]) translate([loc.x, loc.y, 0]) cylinder(r = standoffRad, h = standoffHeight);
        }
        difference() {
          translate([-(perimeterWidth + perimeterGap), -(perimeterWidth + perimeterGap), -caseHeight]) cube([halfCaseLen+(perimeterWidth + perimeterGap), keyboardWidth+(perimeterWidth + perimeterGap)*2, caseHeight+perimeterHeight]);
          translate([-perimeterGap, -perimeterGap, 0]) cube([halfCaseLen + perimeterGap + eps, keyboardWidth + perimeterGap*2, perimeterHeight + eps]);
        }
      }
      #for (loc=holeLocations) {
        if(loc[3]) translate([loc.x, loc.y, -caseHeight - eps]) cylinder(r = holeRad, h = holeDepth);
      }
    } 
    translate([halfCaseLen + 20, 0, 0]) rotate([0, 0, 60]) cube([150, 50, 50], center=true);
    translate([halfCaseLen + 20, keyboardWidth - 30, 0]) rotate([0, 0, -60]) cube([150, 50, 50], center=true);

    for(ix=[0]) for (iy=[0]) {
      
    }
  }
}
