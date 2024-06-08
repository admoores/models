$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  cylinder(r=12.5, h=4, center=true);
  translate([0, 0, 2]) cylinder(r=9.75, h=3, center=true);
}