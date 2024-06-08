$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

height = 75;
depth = 50;
width = 10;
thickness = 3.2;
screwShoulder = 1.2;
screwHeadRad = 3;
screwShaftRad = 1.7;
screwHoleDiam = 4.75;
countersinkDiam = 9;
screwDepth = thickness;
screwShoulderDepth = 2.5;


difference() {
  linear_extrude(width) {
    difference() {
      polygon([[0, 0], [0, height], [depth, 0]]);
      polygon([[thickness, thickness], [thickness, height - ((2*thickness*height) / depth)], [depth - thickness, thickness]]);
    }
  }

  union() {
    translate([screwShoulder, height / 2, width / 2]) rotate([0, 90, 0]) cylinder(r = screwHeadRad, h=depth + .1);
    translate([-.1, height / 2, width / 2]) rotate([0, 90, 0]) cylinder(r = screwShaftRad, h=thickness + .1);
    translate([depth / 2, -.05, width / 2]) rotate([-90, 0, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, screwDepth, screwShoulderDepth);
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

