$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

spoutWidth = 50 / 2;
outerWidth = 80 / 2;
bottomThickness = 10;
height = 60;

difference() {
  union() {
    cylinder(r1 = outerWidth * 1.25, r2 = outerWidth, h = height);
  }

  translate([0, 0, bottomThickness]) cylinder(h = height, r = spoutWidth);
  translate([0, 0, height]) sphere(r = (outerWidth - spoutWidth) / 2 + spoutWidth);
}