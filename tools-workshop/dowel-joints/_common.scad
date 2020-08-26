holeRad = 6.4;
wallThickness = 2.4;
insertDepth = 20;
offsetDepth = 7;
screwHoleDiam = 4.75;
countersinkDiam = 9;
footHeight = 10;
distanceFromWall = 38 - holeRad;


module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
  translate([0, 0, d - ds + 2*t + ds - .01]) cylinder(r=rh, h=ds + t + 5);
}