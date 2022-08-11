$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cylinder(r = 50, h=15);
  for (i=[0:36:360]) {
    rotate([0, 25, i]) translate([30, 0, 17.5]) cube([4.5, 11, 20]);
  }  
}