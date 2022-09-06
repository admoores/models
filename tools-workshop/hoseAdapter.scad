$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

hose1ID = 58;
hose2OD = 31.5;
wallThickness = 1.2;

interfaceLength = 30;

difference() {
  cylinder(r = hose1ID / 2, interfaceLength);
  translate([0, 0, -.5]) cylinder(r = hose1ID / 2 - wallThickness * 2, h = interfaceLength + 1);
}

translate([0, 0, interfaceLength]) difference() {
  cylinder(r1 = hose1ID / 2, r2 = hose2OD / 2 + wallThickness * 2, h = interfaceLength);
  cylinder(r1 = hose1ID / 2 - wallThickness * 2, r2 = hose2OD / 2, h = interfaceLength);
}

translate([0, 0, interfaceLength * 2]) difference() {
  cylinder(r = hose2OD / 2 + wallThickness * 2, h = interfaceLength);
  translate([0, 0, -.5]) cylinder(r = hose2OD / 2, h = interfaceLength + 1);
}