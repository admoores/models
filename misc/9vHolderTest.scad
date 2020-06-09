$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

batteryWidth = 27;
batteryHeight = 18;
batteryDepth = 50;
wallThickness = 2;

difference() {
  cube([batteryWidth + wallThickness * 2, batteryHeight + wallThickness * 2, 25], center=true);
  translate([0, 0, -.5]) cube([batteryWidth, batteryHeight, 26], center=true);
  rotate([90, 0, 0]) cylinder(r = 10, h = 100, center=true);
}