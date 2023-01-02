$fa=4 + 0; // default minimum facet angle is now 0.5
$fs=0.05 + 0; // default minimum facet size is now 0.05 mm
eps = .001 + 0;

// outer Height of container
ze = 75;
// outer Width of container
xe = 25;
// outer Length of container
ye = 25;
// Radius of outer chamfer (the rest inset from there);
re = 4;

Z = ze;
X = xe - re * 2 <= 0 ? eps : xe - re * 2;
Y = ye - re * 2 <= 0 ? eps : ye - re * 2;

// Lid Overlap Ratio
ql = .75;

// Tolerance for lid fit
t = 0.025;

// Thickness of all walls
tw = .9;

// Enable or disable extra width on base for lid to hit
baseLip = true;

// Gap between parts (remove the +0 to make editable)
gapBetween = 5 + 0;

union() {
  difference() {
    union() {
      if (baseLip) linear_extrude(Z * (1 - ql) - t) offset(re) square([X, Y], center = true);
      linear_extrude(Z - tw - t) offset(re - tw - t) square([X, Y], center = true);
    }
    translate([0, 0, tw]) linear_extrude(Z) offset(re - tw * 2 - t) square([X, Y], center = true);
  }

  translate([X + re * 2 + gapBetween, 0, 0]) difference() {
    linear_extrude(Z * ql) offset(re) square([X, Y], center = true);
    translate([0, 0, tw]) linear_extrude(Z) offset(re - tw) square([X, Y], center = true);
  }
}

