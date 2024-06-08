$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  baseShape();
  resize([10, 10, 15]) baseShape();
  translate([0, 0, 12]) rotate([45, 0, 0]) cylinder(r = 1, h = 15);
}

module baseShape() {
  union() {
    cylinder(r = 6, h = 12);
    translate([0, 0, 12]) sphere(r = 6);
  }
}

