cube([6, 50, 3]);
rotate([-90, 0, 0]) translate([3, 0, 49]) difference() {
  cylinder(r = 3, h = 10);
  translate([-5, 0, 0]) cube([10, 10, 10]);
}