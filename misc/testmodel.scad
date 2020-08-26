$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm


difference() {
  rad1 = 6.425;
  cube([19, 20, 5]);
  translate([rad1 + 3, rad1 + 6, -.1]) cylinder(h = 5.2, r=rad1);
  translate([.5, 1, 4.01]) linear_extrude(1) text(text = "6.425mm", size = 4);
}