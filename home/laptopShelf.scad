$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

wallThickness = 7.5;
legThickness = 20.5;
legWidth = 50.6;
legGroundAngle=72.9;

laptopThickness = 16.2;
laptopGap = 1;

bracketHeight = 45;
prongLength = 100;

difference() {
  union() {
    cube([legWidth + wallThickness * 2, bracketHeight, legThickness + wallThickness]);
    translate([legWidth + wallThickness, 0, 0]) cube([wallThickness * 2 + laptopGap + laptopThickness, prongLength, legThickness + wallThickness]);
    translate([legWidth + wallThickness, prongLength, (legThickness + wallThickness) / 2]) rotate([0, 90, 0]) cylinder(r = (legThickness + wallThickness) / 2, h = wallThickness * 2 + laptopGap + laptopThickness);
  }
  translate([legWidth + wallThickness * 2, 0, -40]) rotate([-(90 - legGroundAngle), 0, 0]) cube([laptopThickness + laptopGap, 100, 100]);

  translate([wallThickness, -.01, wallThickness]) cube([legWidth, bracketHeight + .02, legThickness + .01]);
  translate([1.99, -.01, 1.99]) rotate([90, 90, 180]) fillet(2, bracketHeight + .02);
}

module fillet(r, l) {
  difference() {
    cube([r, r, l]);
    translate([0, 0, -.1]) cylinder(h = l + .2, r = r);
  }
}