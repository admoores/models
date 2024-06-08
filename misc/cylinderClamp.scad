$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cylinder(r = 14.5, h = 50);
  translate([0, 0, -.5]) cylinder(r = 11.5, h = 51);
  translate([-20, -2, -.5]) cube([40, 40, 51]);
}

#union () {
  cutoutThickness = 3;
  extrude = 1;
  for(i=[-1, 1]) {
    translate() rotate([90, 0, 0]) cylinder(r = 9.05 + (i * cutoutThickness / 2), h = extrude, center = true);
  }
}