$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

innerRad = 7.2;
innerLen = 54.5;
detentRad = .75;
wallThickness = 2.4;
indexDepth = 8;
indexWidth = 4.5;

union() {
  difference() {
    union() {
      translate([-innerRad, indexWidth / -2, innerLen - indexDepth]) cube([innerRad * 2, indexWidth, indexDepth]);
      rotate_extrude() {
        union () {
          knobProfile();
          translate([innerRad, 0]) union() {
            square([wallThickness, innerLen]);
            translate([-innerRad, innerLen]) square([innerRad + wallThickness, wallThickness]);
            translate([0, detentRad]) circle(r = detentRad);
          }
        }
      }
    }
    union() {
      translate([-1.5, -25, -.1]) cube([3, 50, 20]);
      translate([-25, -1.5, -.1]) cube([50, 3, 20]);
    }
  }
  rotate([0, 0, 90]) union() {
    translate([innerRad, -1.3, 0]) cube([wallThickness, 2.6, 5]);
    translate([-innerRad - wallThickness, -1.3, 0]) cube([wallThickness, 2.6, 5]);
    translate([innerRad, -1.3, 10]) cube([wallThickness, 2.6, 5]);
    translate([-innerRad - wallThickness, -1.3, 10]) cube([wallThickness, 2.6, 5]);
  }
}

module knobProfile() {
  ballRad = 20;
  knobHeight = 90;
  angleStart = 35;

  difference() {
    union() {
      translate([0, knobHeight - ballRad]) circle(r = ballRad);
      polygon([[innerRad + wallThickness, angleStart],
        [innerRad + wallThickness, innerLen + wallThickness],
        [0, innerLen + wallThickness],
        [0, knobHeight - ballRad * 2],
        [ballRad - 1, knobHeight - ballRad]]);
    }
    translate([-1000, 0]) square([1000, 1000]); // To delete half of it so it can be rotated
    translate([0, 10]) square([innerRad, innerLen - 10]); // to clear out the interior of the mian cylinder
  }
}