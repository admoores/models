$fa=4 + 0; // default minimum facet angle is now 0.5
$fs=0.05 + 0; // default minimum facet size is now 0.05 mm
eps = .001 + 0;

// Inner Height of container
zi = 75;
// Inner Width of container
xi = 20;
// Inner Length of container
yi = 20;
// Radius of inner chamfer (the rest expand from there);
ri = 2.5;

Z = zi;
X = xi - ri * 2;
Y = yi - ri * 2;

// Lid Overlap Ratio
ql = .75;

// Tolerance for lid fit
t = .1;

// Thickness of all walls
tw = .9;

// Enable or disable extra width on base for lid to hit
baseLip = true;

// Gap between parts (remove the +0 to make editable)
gapBetween = 5 + 0;

union() {
  difference() {
    union() {
        linear_extrude(Z + tw) offset(r = ri + tw) square([X, Y], center = true);
        if (baseLip) linear_extrude((Z + tw) * (1 - ql)) offset(r = ri + tw * 2 + t) square([X, Y], center = true);
    }
    translate([0, 0, tw])  linear_extrude(Z + eps) offset(r = ri) square([X, Y], center = true);
  }
  translate([xi + tw * 3 + t + (baseLip ? tw : 0) + gapBetween, 0, 0]) difference() {
    linear_extrude((Z + tw) * ql + t) offset(r = ri + tw * 2 + t) square([X, Y], center = true);
    translate([0, 0, tw]) linear_extrude(Z + eps) offset(r = ri + tw + t) square([X, Y], center = true);
  }
}

