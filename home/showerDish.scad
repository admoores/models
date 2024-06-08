include <../_constants.scad>

part = 0; // [0: Tray, 1: Hook]

unit = 25;
baseDimensions = [50, unit*3, unit];

finWidth = 2.5;
filRad = .9;

if (part == 0) {
  difference() {
    union() {
      translate([0, 0, -baseDimensions.z/2]) cube(baseDimensions, center=true);
      translate([0, unit*(5/4), 0]) rotate([0, 90, 0]) cylinder(r= unit/4, h=baseDimensions.x, center=true);
      translate([0, -unit*(5/4), 0]) rotate([0, 90, 0]) cylinder(r= unit/4, h=baseDimensions.x, center=true);
    }
    rotate([0, 90, 0]) scale([1, 2, 1]) cylinder(r= unit/2, h=baseDimensions.x+eps, center=true);
    translate([0, -unit*(5/4), 0]) rotate([0, 90, 0]) cylinder(r= filRad, h=baseDimensions.x, center=true);
    for(ix=[0:finWidth*2:baseDimensions.x]) rotate([5, 0, 0]) translate([ix - baseDimensions.x/2, 0, 0]) cube([finWidth, baseDimensions.y*2, unit], center=true);
  }
} else if (part == 1) {
  difference() {
    union() {
      cylinder(r = unit/8, h=finWidth, center=true);
      translate([-unit/8, unit*(3/4), 0]) cylinder(r = unit/8, h=finWidth, center=true);
      translate([unit/4, unit, 0]) cylinder(r = unit*(3/8), h=finWidth, center=true);
      translate([0, unit/2, 0]) cube([unit/4, unit, finWidth], center=true);
    }
    cylinder(r = filRad, h=finWidth+eps, center=true);
    translate([unit/4, unit, 0]) cylinder(r = unit/8, h=finWidth+eps, center=true);
    translate([unit*(3/8), unit/2, 0]) cube([unit/2, unit, finWidth+eps], center=true);
  }
  translate([unit/2, unit, 0]) cylinder(r = unit/8, h=finWidth, center=true);
}