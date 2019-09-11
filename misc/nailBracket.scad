$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

// Wood Screw (tolerances built into these values?)
screwHoleDiam = 4.75;
countersinkDiam = 9;


union() {
  difference() {
    cube([12.5, 12.5, 2.5]);
    #translate([7, 7, 0]) rotate() chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, 2.5, 2.5 / 2);
  }
  difference() {
    cube([2.5, 5, 10]);
    translate([-6, -2, 10]) rotate([45, 45, 0]) cube([10, 15, 5]);
  }
}

mirror([0, 1, 0]) {
  union() {
  difference() {
    cube([12.5, 12.5, 2.5]);
    #translate([7, 7, 0]) rotate() chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, 2.5, 2.5 / 2);
  }
  difference() {
    cube([2.5, 5, 10]);
    translate([-6, -2, 10]) rotate([45, 45, 0]) cube([10, 15, 5]);
  }
}
}

module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
}