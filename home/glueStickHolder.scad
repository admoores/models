$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

magRad = 5.15;
magDepth = 2.6;

glueStickRad = 15;
wallThickness = 3.2;

difference() {
  union() {
    cylinder(h = 50, r = glueStickRad + wallThickness);
    translate([-(glueStickRad + wallThickness), 0, 0]) cube([(glueStickRad + wallThickness) * 2, glueStickRad + wallThickness + magDepth, 50]);
  }


  #magnetHole(0, glueStickRad + wallThickness + magDepth + .001, 15);
  #magnetHole(0, glueStickRad + wallThickness + magDepth + .001, 35);
  translate([0, 0, wallThickness]) cylinder(h = 50, r = glueStickRad); 
}


module magnetHole(x, y, z) {
  translate([x, y, z]) rotate([90, 0, 0]) cylinder(r = magRad, h = magDepth);
}