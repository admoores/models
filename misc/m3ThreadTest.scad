$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cube([5, 20, 2]);

  translate([2.5, 2.5, -.05]) cylinder(r = 1.125, h = 2.1);
  translate([0, 2.5, -.05]) cylinder(r = .25, h = 2.1);

  translate([2.5, 7.5, -.05]) cylinder(r = 1.25, h = 2.1);
  translate([0, 7.25, -.05]) cylinder(r = .25, h = 2.1);
  translate([0, 7.75, -.05]) cylinder(r = .25, h = 2.1);

  translate([2.5, 12.5, -.05]) cylinder(r = 1.375, h = 2.1);
  translate([0, 12, -.05]) cylinder(r = .25, h = 2.1);
  translate([0, 12.5, -.05]) cylinder(r = .25, h = 2.1);
  translate([0, 13, -.05]) cylinder(r = .25, h = 2.1);

  translate([2.5, 17.5, -.05]) cylinder(r = 1.5, h = 2.1);
  translate([0, 16.75, -.05]) cylinder(r = .25, h = 2.1);
  translate([0, 17.25, -.05]) cylinder(r = .25, h = 2.1);
  translate([0, 17.75, -.05]) cylinder(r = .25, h = 2.1);
  translate([0, 18.25, -.05]) cylinder(r = .25, h = 2.1);
}

// 1 = 2.25
// 2 = 2.5
// 3 = 2.75
// 4 = 3