$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

tolerance = .1;

clampGap = .25;
pipeRad = 6.75 + tolerance;
insertDepth = 15;
totalLen = 25;
groundHeight = 14;
wallThickness = 3.2;

screwHeadExtraGap = .75;
screwRad = 1.5 + 4 * tolerance;
screwHeadRad = 2.25 + screwHeadExtraGap;
nutRad = 3.1 + tolerance;

difference() {
  union() {
    translate([0, 0, -groundHeight - pipeRad]) cylinder(h = totalLen + groundHeight + pipeRad, r = pipeRad + wallThickness);
    rotate([90, 0, 0]) cylinder(h = totalLen, r = pipeRad + wallThickness);
    translate([-pipeRad - wallThickness, -totalLen, -groundHeight - pipeRad]) cube([(pipeRad + wallThickness) * 2, totalLen, groundHeight + pipeRad]);
  }

  union() {
    translate([0, 0, totalLen - insertDepth -.1]) cylinder(h = insertDepth + .2, r = pipeRad);
    translate([0, insertDepth - totalLen -.1, 0]) rotate([90, 0, 0]) cylinder(h = insertDepth + .1, r = pipeRad);
    // translate([clampGap, -50, -50]) cube([20, 100, 100]);
    // rotate([0, 90, 0]) cylinder(h = 50, r = screwRad, center=true);
    // translate([-5, 0, 0]) rotate([0, -90, 0]) linear_extrude(50) cylinder(h = 50, r = screwHeadRad);
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