include <_common.scad>

spoolWidth = 5;
spoolDiam = 150;

height = 20;

difference() {
  cube([railDistance * 2 + wallThickness * 2, height, spoolWidth]);
  translate([wallThickness, -.1, -.1]) cube([railDistance * 2, railDiam * 1.5, spoolWidth + .2]);
  // FOR MAIN PIECE
  translate([railDistance + wallThickness, spoolDiam / 2 + railDiam * 1.5 + wallThickness, -.1]) cylinder(r = spoolDiam / 2, h = spoolWidth + .2);
  translate([wallThickness, railDiam, -.1]) cylinder(r = railDiam / 2, h = spoolWidth + .2);
  translate([wallThickness + railDistance * 2, railDiam, -.1]) cylinder(r = railDiam / 2, h = spoolWidth + .2);

  // FOR END PIECE
  // difference() {
  //   union() {
  //     translate([railDistance * 2 + wallThickness * 2 - height + .01, 0, -.1]) fillet(r = height, l = spoolWidth + .2);
  //     translate([height - .01, 0, -.1]) rotate([0, 0, 90]) fillet(r = height, l = spoolWidth + .2);
  //   }
  //   translate([-.1, 0, -.1]) cube([railDistance * 2 + wallThickness * 2 + .2, railDiam * 2.5, spoolWidth + .2]);
  // }
}