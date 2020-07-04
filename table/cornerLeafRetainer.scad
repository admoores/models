$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm
tolerance = .1;

tabWidth = tol(2.25);
totalLen = tol(22.5);
slotGap = tol(2.25);
slotDepth = tol(4);
spacerWidth = tol(8.5);
spacerThickness = tol(10);
detentWidth = tol(1);
detentGap = tol(2);
totalThickness = 5;


linear_extrude(totalThickness) for (i = [0, 1]) mirror([i, 0, 0]) {
  translate ([detentGap / 2, 0]) union() {
    translate([detentGap / -2, 0]) square([detentGap / 2, slotDepth + slotGap + spacerThickness]);
    square([tabWidth, totalLen]);
    translate([tabWidth, slotDepth + slotGap]) square([spacerWidth, spacerThickness]);
    polygon([
      [tabWidth, 0],
      [tabWidth, slotDepth],
      [tabWidth + slotDepth, slotDepth]
    ]);
    difference() {
      translate([0, totalLen - tabWidth]) circle(tabWidth + detentWidth);
      translate([-5, totalLen]) square([20, 20]);
      translate([-20, totalLen - 19]) square([20, 20]);
    }
  }
}


function tol(value, m = 1) = value - (m * tolerance);