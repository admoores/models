include <../../_constants.scad>

// innerDimensions = [32, 70, 25]; // 12v Power Supply
innerDimensions = [27.5, 65, 27.5]; // Relay and Arduino
wallThickness = 2;

tabThickness = 4;

holeRad = 8;

screwRad = 1.4;

supportGap = .3;

difference() {
  union() {
    minkowski() {
      sphere(wallThickness);
      cube(innerDimensions, center = true);
    }
    yWidth = innerDimensions.y + wallThickness * 2 + screwRad * 4;
    difference () {
      for (shiftY = [yWidth/2, yWidth/-2]) for(shiftX = [innerDimensions.x / 2 - screwRad * 2, innerDimensions.x / -2 + screwRad * 2]) {
        translate([shiftX, 0, 0]) cube([screwRad*4, yWidth, tabThickness*2], center=true);
        translate([shiftX, shiftY, 0]) cylinder(r=screwRad*2, h=tabThickness*2, center=true);
        
        translate([shiftX, shiftY, -innerDimensions.z/2 - wallThickness]) cylinder(r=screwRad*1.75, h=innerDimensions.z/2 - tabThickness - supportGap + wallThickness);
      }
      for (shiftY = [yWidth/2, yWidth/-2]) for(shiftX = [innerDimensions.x / 2 - screwRad * 2, innerDimensions.x / -2 + screwRad * 2]) {
        translate([shiftX, shiftY, 0]) cylinder(r=screwRad, h=tabThickness*2 + eps*2, center=true);
      }
    }
  }
  cube(innerDimensions, center = true);
  translate([0, 0, innerDimensions.z]) cube(innerDimensions * 2, center=true);
  rotate([90,0,0]) cylinder(r = holeRad, h = innerDimensions.y + (wallThickness + eps) * 2, center=true);
}