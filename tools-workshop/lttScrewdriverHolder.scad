$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

hookInternal = 7;
hookOffset = 5.15;

offsetBlockLen = 10;
hookLen = 25;
hookShortLen = 5;

shaftDiam = 10;
collarDiam = 28;
collarDepth = 26;

wallThickness = 2.6;

difference() {
  union() {
    cube([collarDepth + wallThickness, collarDiam / 2 + wallThickness * 2.5 + hookInternal, collarDiam + wallThickness * 2]);
    translate([0, collarDiam / 2 + wallThickness * 2.5 + hookInternal, collarDiam / 2 + wallThickness]) rotate([0, 90, 0]) cylinder(r = collarDiam / 2 + wallThickness, h = collarDepth + wallThickness);
    cube([collarDepth + wallThickness + hookLen, hookInternal + wallThickness * 2, collarDiam + wallThickness * 2]);
    translate([collarDepth + wallThickness + hookLen, hookInternal / 2 + wallThickness, 0]) cylinder(r = hookInternal / 2 + wallThickness, h = collarDiam + wallThickness * 2);
  }

  #translate([wallThickness, collarDiam / 2 + wallThickness * 2.5 + hookInternal, collarDiam / 2 + wallThickness]) rotate([0, 90, 0]) cylinder(r = collarDiam / 2, h = collarDepth);
  #translate([0, collarDiam / 2 + wallThickness * 2.5 + hookInternal, collarDiam / 2 + wallThickness]) rotate([0, 90, 0]) cylinder(r = shaftDiam / 2, h = wallThickness);

  translate([collarDepth + wallThickness + hookLen, hookInternal / 2 + wallThickness, 0]) cylinder(r = hookInternal / 2, h = collarDiam + wallThickness * 2);
  translate([offsetBlockLen, wallThickness, 0]) cube([collarDepth + wallThickness + hookLen - offsetBlockLen, hookInternal, collarDiam + wallThickness * 2]);
  translate([offsetBlockLen, 0, 0]) cube([collarDepth + wallThickness + hookLen - offsetBlockLen - hookShortLen, hookInternal, collarDiam + wallThickness * 2]);
  cube([offsetBlockLen, wallThickness + hookInternal - hookOffset, collarDiam + wallThickness * 2]);
}