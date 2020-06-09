$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

innerRad = 15;
bottomHeight = 20;
totalHeight = 50;
wallThickness = .8;
tolerance = .075;
divideHeight = 5;

translate() difference() {
  union() {
    cylinder(r=innerRad + wallThickness, h = bottomHeight);
    cylinder(r=innerRad + tolerance + wallThickness * 2, h = divideHeight);
  }
  translate([0, 0, wallThickness]) cylinder(r=innerRad, h = bottomHeight + .1);
}

translate([50, 0, 0]) union() {
  difference() {
    cylinder(r = innerRad + wallThickness*2 + tolerance, h = totalHeight - divideHeight);
    translate([0, 0, wallThickness]) cylinder(r = innerRad + wallThickness + tolerance, h = totalHeight - divideHeight);
  }
}