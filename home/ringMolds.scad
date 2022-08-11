//$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

height = 20;
radius = 42;
wallThickness = 1.6;
rimThickness = 3.6;
rimHeight = 2;

difference() {
  union() {
    cylinder(r = (radius + rimThickness + wallThickness), h = rimHeight);
    cylinder(r = radius + wallThickness, h = height);
  }

  translate([0, 0, -.1]) cylinder(r = radius, h = height + .2);
}