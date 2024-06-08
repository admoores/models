$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

tolerance = .1;

clampGap = .25;
pipeRad = 6.75 + tolerance;
insertDepth = 30;
totalLen = 40;
groundHeight = 14;
wallThickness = 3.2;
joinAreaWidth = 10;

screwHeadExtraGap = .75;
screwRad = 1.5 + 4 * tolerance;
screwHeadRad = 2.25 + screwHeadExtraGap;
nutRad = 3.1 + tolerance;

mirror([0, 1, 0]) {
  difference() {
    union() {
      cylinder(h = totalLen, r = pipeRad + wallThickness, center = true);
      rotate([90, 0, 0]) cylinder(h = totalLen + joinAreaWidth, r = pipeRad + wallThickness);
    }

    union() {
      cylinder(h = totalLen + .2, r = pipeRad, center=true);
      translate([0, insertDepth - totalLen - joinAreaWidth -.1, 0]) rotate([90, 0, 0]) cylinder(h = insertDepth + .1, r = pipeRad);
      translate([clampGap, -60, -60]) cube([20, 120, 120]);
      translate([0, -(pipeRad + (joinAreaWidth + wallThickness) / 2), 0]) {
        rotate([0, 90, 0]) cylinder(h = 50, r = screwRad, center=true);
        translate([-5, 0, 0]) rotate([0, -90, 0]) linear_extrude(50) hexagon(nutRad);
      } 
    }
  }
}

module hexagon(r = 1) {
  polygon([
    [-1 * r, 0],
    [-.5 * r, r * sqrt(3) / 2],
    [.5 * r, r * sqrt(3) / 2],
    [1 * r, 0],
    [.5 * r, r * sqrt(3) / -2],
    [-.5 * r, r * sqrt(3) / -2],
  ]);
}