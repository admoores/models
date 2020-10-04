$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

screwHoleDiam = 4.75;
countersinkDiam = 9;
wallThickness = 5;

difference() {
  union () {
    cube([49.5, wallThickness, 15]);
    cube([wallThickness, 20, 15]);
    translate([47, -12.5, 0]) rotate([0, 0, 10]) cube([wallThickness, 15, 15]);
    translate([5, 1, 0]) rotate([0, 0, 45]) cube([5, 5, 15]);
    translate([45.25, -1.75, 0]) rotate([0, 0, 45]) cube([2.5, 2.5, 15]);
  }
  translate([-2.5, 12.5, 7.5]) rotate([0, 90, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, 5 + 1, wallThickness / 2);
}

module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
  translate([0, 0, d - ds + 2*t + ds - .01]) cylinder(r=rh, h=ds + t + 5);
}