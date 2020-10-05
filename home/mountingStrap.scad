$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

width = 215;
depth = 25.5;

wallThickness = 3.2;
strapThickness = 20;

screwHoleDiam = 4.75;
countersinkDiam = 9;

tabLen = 7.5;


difference() {
  union() {
    cube([width + wallThickness * 2, wallThickness, strapThickness]);
    cube([wallThickness, depth + wallThickness, strapThickness]);
    translate([wallThickness + width, 0, 0]) cube([wallThickness, depth + wallThickness, strapThickness]);
    translate([-tabLen + .01, depth, 0]) cube([tabLen, wallThickness, strapThickness]);
    translate([width + wallThickness * 2 - .01, depth, 0]) cube([tabLen, wallThickness, strapThickness]);
    translate([-tabLen + .01, depth + wallThickness, strapThickness / 2]) rotate([90, 0, 0]) cylinder(r = strapThickness / 2, h = wallThickness);
    translate([width + wallThickness * 2 - .01 + tabLen, depth + wallThickness, strapThickness / 2]) rotate([90, 0, 0]) cylinder(r = strapThickness / 2, h = wallThickness);
  }

  translate([-tabLen, depth + wallThickness * 2, strapThickness / 2]) rotate([90, 0, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness * 2, wallThickness / 2);
  translate([width + 2 * wallThickness + tabLen, depth + wallThickness * 2, strapThickness / 2]) rotate([90, 0, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness * 2, wallThickness / 2);
}

module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
  translate([0, 0, d - ds + 2*t + ds - .01]) cylinder(r=rh, h=ds + t + 5);
}
