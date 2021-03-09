$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm


difference() {
  rad1 = 10 / 2;
  rad2 = 10.5 / 2;
  rad3 = 11 / 2;
  height = 10;
  cube([(rad1 + rad2 + rad3) * 2 + 12, rad3 * 2 + 9, height]);
  translate([rad1 + 3, rad1 + 6, -.1]) cylinder(h = height + 0.2, r=rad1);
  translate([(rad1 * 2) + rad2 + 6, rad1 + 6, -.1]) cylinder(h = height + 0.2, r=rad2);
  translate([((rad1 + rad2) * 2) + rad3 + 9, rad1 + 6, -.1]) cylinder(h = height + 0.2, r=rad3);
  translate([.5, 1, height - 1.99]) linear_extrude(2) text(text = str(rad1), size = 4);
  translate([rad1 * 2 + 4, 1, height - 1.99]) linear_extrude(2) text(text = str(rad2), size = 4);
  translate([(rad1 + rad2) * 2 + 7.5, 1, height - 1.99]) linear_extrude(2) text(text = str(rad3), size = 4);
}