$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

// 8020 rail
railGap = 6.5;
// Bracket
bracketHeight = 17;
bracketTabLength = 20;
bracketThickness = 3;
bracketWidth = 15;
railIndexDepth = 2;
tolerance = .3;
// Wood Screw (tolerances built into these values?)
screwHoleDiam = 4.75;
countersinkDiam = 9;
// M6 Bolt
headRadius = 10.5 / 2;
shaftRadius =  6 / 2;
// Rivet
rivetDiam = 5.5;

difference() {
  union() {
    cube([bracketTabLength - bracketThickness, bracketWidth, bracketThickness]);
    translate([bracketTabLength - bracketThickness, 0, 0]) {
      cube([bracketThickness, bracketWidth, bracketHeight]);
      translate([bracketThickness, 0, (bracketHeight - (tol(railGap, 2))) / 2]) cube([railIndexDepth, bracketWidth, tol(railGap, 2)]);
    }
    translate([bracketTabLength - bracketThickness - 2, bracketWidth, bracketThickness + 2]) rotate([90, 90, 0]) fillet(2, bracketWidth);
  }

  union() {
    translate([bracketTabLength + railIndexDepth, bracketWidth / 2, bracketHeight / 2]) rotate([0, -90, 0]) flatScrewHole(tol(headRadius, -1), tol(shaftRadius, -1), bracketThickness + railIndexDepth, bracketThickness / 2);
    translate([1, bracketWidth + .1, bracketThickness - 1]) rotate([90, -90, 0]) fillet(1, bracketWidth + .2);
    translate([1, bracketWidth + .1, 1]) rotate([90, 180, 0]) fillet(1, bracketWidth + .2);
    translate([bracketTabLength - 1, bracketWidth + .1, 1]) rotate([90, 90, 0]) fillet(1, bracketWidth + .2);
    translate([bracketTabLength - 1, bracketWidth + .1, bracketHeight - 1]) rotate([90, 0, 0]) fillet(1, bracketWidth + .2);
    translate([bracketTabLength - bracketThickness + 1, bracketWidth + .1, bracketHeight - 1]) rotate([90, -90, 0]) fillet(1, bracketWidth + .2);
    translate([(bracketTabLength - bracketThickness) / 2, bracketWidth / 2, -.1]) cylinder(r = tol(rivetDiam / 2, -1), h = bracketThickness + .2);
  }
}

function tol(value, m) = value - (m * tolerance);

module fillet(r, l) {
  difference() {
    cube([r, r, l]);
    translate([0, 0, -.1]) cylinder(h = l + .2, r = r);
  }
}

module flatScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(h = d + t, r = rs);
  translate([0, 0, d - ds + t]) cylinder(h = ds + t, r = rh);
}

module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
}
