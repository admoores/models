$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

screwHoleDiam = 4.75;
countersinkDiam = 9;

screwDepth = 2.4;
screwShoulderDepth = 2.5;

difference() {
  union() {
    difference() {
      cube([20, 40, 2.4]);
      translate([10, 7.5, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, screwDepth, screwShoulderDepth);
      translate([10, 32.5, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, screwDepth, screwShoulderDepth);
    }
    translate([0, 20 - (2.4 / 2), 0]) cube([20, 2.4, 30]);
    translate([0, 16 - (2.4 / 2), 4 + 2.4]) rotate([0, 90, 0]) fillet(r = 4, l = 20);
    translate([20, 24 + (2.4 / 2), 4 + 2.4]) rotate([0, 90, 180]) fillet(r = 4, l = 20);
    translate([0, 20, 30]) rotate([90, 180, 90]) linear_extrude(20) {
      teardrop(5);
    }
  }

  union() {
    translate([-.1, 20, 30]) rotate([0, 90, 0]) cylinder(r=2.4, h=20.2);
    translate([2.45, 2.45, -.1]) rotate([0, 0, 180]) fillet(r=2.5, l=2.6);
    translate([20 - 2.45, 2.45, -.1]) rotate([0, 0, 270]) fillet(r=2.5, l=2.6);
    translate([20 - 2.45, 40 - 2.45, -.1]) rotate([0, 0, 0]) fillet(r=2.5, l=2.6);
    translate([2.45, 40 - 2.45, -.1]) rotate([0, 0, 90]) fillet(r=2.5, l=2.6);
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

module fillet(r, l) {
  difference() {
    cube([r, r, l]);
    translate([0, 0, -.1]) cylinder(h = l + .2, r = r);
  }
}