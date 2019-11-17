$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cylinder(r = 14.5, h = 50);
  union() {
    translate([0, 0, -.5]) cylinder(r = 12.9, h = 51);
    translate([-20, -2, -.5]) cube([40, 40, 51]);
  }
  difference() {
    keyHoleShape(1, 3, 50);
    translate([-.5, 0, 0]) keyHoleShape(-1, 3, 51);
  }
}

difference() {
  translate([0, 0, 0]) cylinder(r = 12.1, h = 50);
  translate([-20, -2, -.5]) cube([40, 40, 51]);
}



module keyHoleShape(i, thickness, extrude) {
  translate([0, extrude - 25, 33.84]) rotate([90, 0, 0]) cylinder(r = 9.05 + (i * thickness / 4), h = extrude, center = false);
  cubeX = 18.1 + (i * thickness / 2);
  translate([cubeX / -2, -25, 5]) cube([cubeX, extrude, 29.04 + (i * thickness / 4)]);
}