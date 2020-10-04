$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

wallThickness = 7.5;
legThickness = 20.5;
legWidth = 50.6;
legGroundAngle=72.9;

laptopThickness = 16.2;
laptopGap = 1;

bracketHeight = 10;
prongLength = 100;

difference() {
  union() {
    cube([legWidth + wallThickness * 2, bracketHeight, legThickness + wallThickness]);
  }

  translate([wallThickness, -.01, wallThickness]) cube([legWidth, bracketHeight + .02, legThickness + .01]);
}