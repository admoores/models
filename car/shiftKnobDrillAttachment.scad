$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  intersection() {
      translate([-4, -7.5, 0]) cube([8, 13, 65]);
      union() {
        cylinder(r = 6, h=50);
        cylinder(r = 4.5, h = 65);
      }
  }
  translate([-5, -3, -.1]) cube([10, 6, 10.1]);
}