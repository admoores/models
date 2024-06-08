$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cube([15, 120, 10]);

  for (i = [0:1:4]) {
      translate([7.5, 10 + i * 25, 1]) resize([8, 5.5, 15]) cylinder(r = 2.5, h = 15);
  }
}