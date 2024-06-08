$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

innerRad = 7.5;
innerLen = 54.5;
detentRad = 1;
wallThickness = 1.6;
indexDepth = 8;
indexWidth = 4;

difference() {
  union() {
    translate([-innerRad, indexWidth / -2, innerLen - indexDepth]) cube([innerRad * 2, indexWidth, indexDepth]);
    rotate_extrude() {
      translate([innerRad, 0]) union() {
        square([wallThickness, innerLen]);
        translate([-innerRad, innerLen]) square([innerRad + wallThickness, wallThickness]);
        translate([0, detentRad]) circle(r = detentRad);
      }
    }
  }
  union() {
    translate([-1.5, -25, -.1]) cube([3, 50, 20]);
    translate([-25, -1.5, -.1]) cube([50, 3, 20]);
  }
}

