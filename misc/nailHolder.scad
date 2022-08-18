$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

resize([5, 7.5, 42.5]) {
  cylinder(r = 2.5, h = 40);
  translate([0, 0, 40]) sphere(r = 2.5);
}