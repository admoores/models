$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

screwHoleDiam = 4.75;
countersinkDiam = 9;

screwDepth = 2.6;
screwShoulderDepth = 2.5;

union() {
  difference() {
    cube([20, 40, 2.4]);
    translate([10, 10, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, screwDepth, screwShoulderDepth);
    translate([10, 30, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, screwDepth, screwShoulderDepth);
  }
}

module teardrop(radius) {
  coordinate = radius * sqrt(2) / 2;
  union() {
    circle(r = radius);
    polygon([[coordinate, coordinate], [-coordinate, coordinate], [0, 2 * coordinate]]);
  }
}

module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
}