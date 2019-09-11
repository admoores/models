$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

screwHoleDiam = 4.75;
countersinkDiam = 9;

screwDepth = 5;
screwShoulderDepth = 2.5;

mainDiameter = 15;
widerDiameter = 18;
totalLength = 25;
widerThickness = 2;


difference() {
  union() {
    cylinder(r = mainDiameter / 2, h=totalLength);
    translate([0, 0, totalLength - widerThickness]) cylinder(r = widerDiameter / 2, h = widerThickness);
    translate([0, 0, totalLength - 2*widerThickness]) cylinder(r2 = widerDiameter / 2, r1 = mainDiameter / 2, h = widerThickness);
    cylinder(r = widerDiameter / 2, h = widerThickness);
    translate([0, 0, widerThickness]) cylinder(r1 = widerDiameter / 2, r2 = mainDiameter / 2, h = widerThickness);

  }
  translate([0, 0, -.01]) union() {
    translate([0, 0, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, screwDepth, screwShoulderDepth);
    translate([0, 0, screwDepth]) cylinder(r = countersinkDiam / 2, h = totalLength);
  }
}


module chamferedScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(r=rs, h=d + t);
  translate([0, 0, d - ds + t]) cylinder(r1=rs, r2=rh, h=ds + t);
}

function tol(value, m) = value - (m * tolerance);