$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

barHeight = 20.5;
cardReaderLen = 50;
cardReaderHeight = 13.5;
cardReaderWidth = 36.2;
wallThickness = 2.4;
filletRad = 1;
screwHoleDiam = 4.75;
countersinkDiam = 9;

intersection() {
  translate([filletRad, 99, filletRad]) rotate([90, 0, 0]) linear_extrude(100) offset(filletRad) {
    square([cardReaderWidth + wallThickness * 2 - filletRad * 2, 50]);
  }
  difference() {
    union() {
      cube([cardReaderWidth + wallThickness * 2, cardReaderLen + wallThickness, cardReaderHeight + wallThickness]);
      cube([cardReaderWidth + wallThickness * 2, cardReaderLen + wallThickness - barHeight, cardReaderHeight + wallThickness + barHeight]);
    }

    translate([wallThickness, wallThickness + .01, wallThickness + .01]) cube([cardReaderWidth, cardReaderLen, cardReaderHeight]);
    translate([wallThickness + 5, -.01, wallThickness + .01]) cube([cardReaderWidth - 10, cardReaderLen, cardReaderHeight]);
    translate([(cardReaderWidth + wallThickness * 2) * (1/4), (cardReaderLen + wallThickness - barHeight) / 2, cardReaderHeight + wallThickness + barHeight]) {
      rotate([180, 0, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness * 2, wallThickness / 2);
      translate([0, 0, -50 - wallThickness * 2.5]) cylinder(h = 50, r = countersinkDiam / 2);
    }
    translate([(cardReaderWidth + wallThickness * 2) * (3/4), (cardReaderLen + wallThickness - barHeight) / 2, cardReaderHeight + wallThickness + barHeight]) {
      rotate([180, 0, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness * 2, wallThickness / 2);
      translate([0, 0, -50 - wallThickness * 2.5]) cylinder(h = 50, r = countersinkDiam / 2);
    }
  }
}

module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
  translate([0, 0, d - ds + 2*t + ds - .01]) cylinder(r=rh, h=ds + t + 5);
}