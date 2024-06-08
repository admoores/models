$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

screwHoleDiam = 4.75;
countersinkDiam = 9;

difference() {
  union() {
    translate([0, 6, 0]) cube([22, 60, 12]);
    translate([0, 6, 6]) rotate([0, 90, 0]) cylinder(r = 6, h = 22);
    translate([0, 66, 6]) rotate([0, 90, 0]) cylinder(r = 6, h = 22);
  }

  translate([0, 0, -.1]) {
    translate([-.1, -.1, 0]) cube([8.6, 20.1, 12.2]);
    translate([5, 25, 0]) cube([12, 50.1, 12.2]);  
  }

  #translate([2.5, 6, 6]) {
    rotate([0, 90, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, 5 * 2, 5 / 2);
  }
}


module chamferedScrewHole(rh, rs, d, ds, t = .1, holeDepth = 15) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
  translate([0, 0, d - ds + 2*t + ds - .01]) cylinder(r=rh, h=ds + t + holeDepth);
}