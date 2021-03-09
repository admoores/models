$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

lengthFromOrigin = 95.7;
fullLength = 125;
fullThickness = 9;
arcRadius = 260;
thickestWidth = 36.5;
centerToHole = 16.6;
holeLength = 15;
holeWidth = 6.5;
wallThickness = 2.25;
centerToTop = fullLength - lengthFromOrigin;
gapDepth = 23;
centerToGap = centerToTop - gapDepth;

union() {
  difference() {
    intersection() {
      translate([(arcRadius - thickestWidth / 2), 0, 0]) {
        cylinder(h=fullThickness, r=arcRadius, center=false);
      }
      translate([-1 * (arcRadius - thickestWidth / 2), 0, 0]) {
        cylinder(h=fullThickness, r=arcRadius, center=false);
      }
      translate([(-2 * fullThickness),(lengthFromOrigin * -1),0]) {
        cube([thickestWidth, fullLength, fullThickness]);
      }
    }
    translate([0, (lengthFromOrigin * -1) + 7, 0]) {
      difference() {
        translate([-2.5, -10, -1]) {
          cube([5, 10, fullThickness + 2]);
        }
        translate([0, 0, -2]) {
          cylinder(h=fullThickness + 4, r=2.5, center=false);
        }
      }
    }
    translate([holeLength / -2, centerToHole, -1]) {
      cube([holeLength, holeWidth, fullThickness + 2]);
    }
    translate([-25, centerToGap, wallThickness]) {
      cube([50, gapDepth + 1, (fullThickness - 2*wallThickness)]);
    }
    intersection() {
      translate([(arcRadius - thickestWidth / 2), 0, wallThickness]) {
        cylinder(h=fullThickness - (2 * wallThickness), r=arcRadius - wallThickness, center=false);
      }
      translate([-1 * (arcRadius - thickestWidth / 2), 0, wallThickness]) {
        cylinder(h=fullThickness - (2 * wallThickness), r=arcRadius - wallThickness, center=false);
      }
    }
    translate([(thickestWidth / -2) + 4, centerToTop - 2.5, -1]) {
      difference() {
        translate([-5,0,0]) {
          cube([5, 5, fullThickness + 2]);
        }
        cylinder(h=fullThickness + 2, r=2.5, center=false);
      }
    }
    translate([(thickestWidth / 2) - 4, centerToTop - 2.5, -1]) {
      difference() {
        cube([5, 5, fullThickness + 2]);
        cylinder(h=fullThickness + 2, r=2.5, center=false);
      }
    }
  }

  // Belt Clip
  clipLength = 15; // Relative to Y axis
  clipWidth = 35; // Relative to X axis
  clipStrutThickness = 5; // Relative to Y axis

  translate([(clipWidth / -2), 10 - clipLength, fullThickness]) {
    difference() {
      cube([clipWidth, clipLength, fullThickness - wallThickness]);
      translate([-1, -4.5, 0]) {
        intersection() {
          cube([clipWidth + 2, clipLength + 2, 4.5]);
          translate([0, wallThickness + clipStrutThickness - (10-clipLength) - 2.5, 2.25]) {
            rotate([0, 90, 0]) {
              cylinder(h=clipWidth + 2, r=2.5, center=false);
            }
          }
        }
      }
      translate([-1, -wallThickness - clipStrutThickness, 0]) {
          cube([clipWidth + 2, clipLength - 3, fullThickness/2]);
      }
      translate([-1, 3.5, (fullThickness  + wallThickness) / 2]) {
        difference() {
          translate([0, -5, -2.5]) {
            cube([clipWidth + 2, 5, 5]);
          }
          rotate([0, 90, 0]) {
            cylinder(h=clipWidth + 2, r=1.25, center=false);
          }
        }
      }
      translate([-1, clipLength - wallThickness, wallThickness * 2]) {
        difference() {
          cube([clipWidth + 2, 2.5, 2.5]);
          rotate([0, 90, 0]) {
            cylinder(h=clipWidth + 2, r=2.5, center=false);
          }
        }
      }
    }
    translate([0, clipLength + 2.5, wallThickness]) {
      difference() {
        translate([0, -2.5, -2.5]) {
          cube([clipWidth, 2.5, 2.5]);
        }
        translate([-1, 0, 0]) {
          rotate([0, 90, 0]) {
            cylinder(h=clipWidth + 2, r=2.5, center=false);
          }
        }
      }
    }
  }
}