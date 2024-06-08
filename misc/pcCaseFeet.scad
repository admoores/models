$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cylinder(h = 35, r1 = 75/2, r2 = 55/2);
  translate([0, 0, 30]) cylinder(h = 15, r = 50/2); 
  translate([0, 0, -1]) cylinder(h = 50, r = 30/2);
}