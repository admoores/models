$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

screwShoulder = 1.2;
screwHeadRad = 3;
screwShaftRad = 1.7;
screwHoleDiam = 4.75;
countersinkDiam = 9;
screwDepth = 8;
screwShoulderDepth = 2.5;

difference() {
  cylinder(r = 8, h = 25);
  union() {
    translate([-8.1, 0, -.1]) cube([16.2, 8.1, 25.2]);
    translate([0, 4, 12.5]) rotate([-90, 0, 180]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, screwDepth, screwShoulderDepth);
    translate([0, -4, 12.5]) rotate([-90, 0, 180]) cylinder(r = countersinkDiam / 2, h=8);
  }
}


module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
}