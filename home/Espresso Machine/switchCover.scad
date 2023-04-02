include <../../_constants.scad>

holeHeight = 22.2;
holeWidth = 30.25;
coverThickness = 3.5;
lidThickness = 5;

tabWidth = 2.5;
tabThickness = 2.5;

buttonHoleRad = 10;
lidIndex = 9.5;
lidIndexDepth = 1;

buttonPressRad = 2.5;
buttonPressDepth = 4;

magnetHoleRad = 3;
magnetHoleDepth = 2.25;
magnetHoleOffset = .75;

coverCurveRad = 60;

difference() {
  union() {
    cube([holeHeight, holeWidth, coverThickness], center=true);
    translate([0, 0, coverThickness/-2 + tabThickness/2]) cube([holeHeight, holeWidth + tabWidth * 2, tabThickness], center=true);
  }
  cylinder(r = buttonHoleRad, h = coverThickness + eps * 2, center = true);
  translate([holeHeight / 2 - (magnetHoleRad + magnetHoleOffset), holeWidth / 2 - (magnetHoleRad + magnetHoleOffset), coverThickness / 2 - magnetHoleDepth]) cylinder(r = magnetHoleRad, h = coverThickness + eps);
  translate([holeHeight / -2 + (magnetHoleRad + magnetHoleOffset), holeWidth / -2 + (magnetHoleRad + magnetHoleOffset), coverThickness / 2 - magnetHoleDepth]) cylinder(r = magnetHoleRad, h = coverThickness + eps);
}


translate([holeHeight * 2, 0, 0]) {
  intersection() {
    translate([0, 0, coverCurveRad - lidThickness/2]) rotate([0, 90, 0]) cylinder(r = coverCurveRad, h = holeHeight, center=true);
    difference() {
      union() {
        cube([holeHeight, holeWidth, lidThickness], center=true);
        translate([0, 0, lidThickness / 2 + lidIndexDepth/2]) cylinder(r = lidIndex, h = lidIndexDepth, center = true);
        translate([0, lidIndex/2, lidThickness / 2 + buttonPressDepth/2]) cylinder(r = buttonPressRad, h = buttonPressDepth, center = true);
      }
      translate([holeHeight / 2 - (magnetHoleRad + magnetHoleOffset), holeWidth / -2 + (magnetHoleRad + magnetHoleOffset), lidThickness / 2 - magnetHoleDepth]) cylinder(r = magnetHoleRad, h = lidThickness + eps);
      translate([holeHeight / -2 + (magnetHoleRad + magnetHoleOffset), holeWidth / 2 - (magnetHoleRad + magnetHoleOffset), lidThickness / 2 - magnetHoleDepth]) cylinder(r = magnetHoleRad, h = lidThickness + eps);
    }
  }
}

