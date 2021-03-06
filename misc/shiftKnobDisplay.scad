$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

l = 150;
w = 120;
h = 30;
wallThickness = 2;
switchRad = 10;
batteryWidth = 28.5;
batteryHeight = 19.5;
batteryDepth = 50;

difference() {
  union() {
    difference() {
      baseShape(l, w, h, 0);
      translate([0, 0, -.05]) baseShape(l, w, h, -wallThickness);
      translate([-15, 15, 0]) union() {
        rotate([0, 0, -45]) cube([5, 200, h * 2 + 2], center = true);
        translate([-5, 5, 0]) rotate([0, 0, -45]) cube([5, 200, h * 2 + 2], center = true);
        translate([-10, 10, 0]) rotate([0, 0, -45]) cube([5, 200, h * 2 + 2], center = true);
      }
    }
    baseShape(l, w, h, -wallThickness * .75);
    translate([0, -30, h]) difference() {
      rotate([0, 90, 0]) cylinder(r = 25, h = 40, center=true);
      translate([0, 12.5, 12.5]) rotate([-30, 0, 0]) cube([42, 60, 26], center=true);
    }
    translate([0, -30, h + 15]) rotate([-30, 0, 0]) cylinder(r = 7, h = 45, center = true);
  }
  translate([0, -h / 2, (h / 2) - (wallThickness * 2)]) cube([l - wallThickness * 2, w - h - 15, h], center=true);
  translate([-l / 2, 0, h / 2 - wallThickness / 2]) rotate([0, 90, 0]) cylinder(r = switchRad, h = 25, center=true);
  translate([-8, -30, h + 15]) rotate([-30, 0, 0]) cylinder(r = 1.5, h = 75, center=true);
  translate([8, -30, h + 15]) rotate([-30, 0, 0]) cylinder(r = 1.5, h = 75, center=true);
}

// translate([55, (w - h - 15)/2 - (h/2) - batteryWidth / 2, h - batteryHeight / 2 - wallThickness * 2]) rotate([0, 0, 90]) difference() {
//   cube([batteryWidth + wallThickness, batteryDepth - 15, batteryHeight + wallThickness], center=true);
//   translate([wallThickness, 0, wallThickness]) cube([batteryWidth, batteryDepth + 2, batteryHeight], center=true);
// }



module baseShape(len, width, height, offset = 0) {
  x = (len / 2) + offset;
  y = (width / 2) + offset;
  z = height + offset;

  points = [
    [-x, y, 0],
    [x, y, 0],
    [x, -y, 0],
    [-x, -y, 0],
    [-x, -y, z],
    [-x, y - z, z],
    [x, y - z, z],
    [x, -y, z]
  ];
  faces = [
    [4, 5, 6, 7],
    [4, 3, 0, 5],
    [1, 2, 7, 6],
    [2, 3, 4, 7],
    [1, 6, 5, 0],
    [3, 2, 1, 0]
  ];
  polyhedron(points, faces, convexity = 10);
}