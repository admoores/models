include <../_constants.scad>

outerZ = 35;
deskThickness = 26;
outerX = 180;
outerY = 180;

insetDepth = (outerZ - deskThickness)/2 - 1;
insetRad = 5;
screwHole = 5.25/2;

deskOverlap = 20;

barThickness = 7.5;

elementGap = 2.5;


module bagHolder() {
  difference() {
    cube([outerX, outerY, outerZ], center=true);
    difference() {
      hull() {
        translate([0, 0, -outerZ/2 - eps]) linear_extrude(eps) square([outerX - barThickness*4, outerY - barThickness*4], center=true);
        translate([0, 0, outerZ/2]) linear_extrude(eps) square([outerX - barThickness*2, outerY - barThickness*2], center=true);
      }
      hull() {
        translate([0, 0, -outerZ/2 - eps]) linear_extrude(eps) square([outerX - barThickness*4 - elementGap*2, outerY - barThickness*4 - elementGap*2], center=true);
        translate([0, 0, outerZ/2]) linear_extrude(eps) square([outerX - barThickness*2 - elementGap*2, outerY - barThickness*2 - elementGap*2], center=true);
      }
    }
    hull() {
      translate([0, 0, -outerZ/2 - eps]) linear_extrude(eps) square([outerX - barThickness*6 - elementGap*2, outerY - barThickness*6 - elementGap*2], center=true);
      translate([0, 0, outerZ/2]) linear_extrude(eps) square([outerX - barThickness*4 - elementGap*2, outerY - barThickness*4 - elementGap*2], center=true);
    }
  }

  translate([outerX/2, 0, 0]) intersection() {
    difference() {
      translate([deskOverlap/2, 0, 0]) cube([deskOverlap, outerY, outerZ], center=true);
      translate([deskOverlap/2, 0, 0]) cube([deskOverlap + eps*2, outerY + eps*2, deskThickness], center=true);
    }
    for (y = [-3/10, 0, 3/10]) translate([0, y*outerY, 0]) difference(){
      rotate([0, 0, 30]) translate([0, 0, -outerZ/2 - eps]) linear_extrude(outerZ + eps*2) hexagon(r = deskOverlap);
      translate([deskOverlap/2, 0, 0]) {
        cylinder(r = screwHole, h = outerZ - insetDepth*2 - .6, center=true);
        for (z = [-outerZ/2, outerZ/2]) translate([0, 0, z])  {
          cylinder(r = insetRad, h = insetDepth * 2, center=true);
        }
      }
    }
  }
}

intersection() {
  translate([0, 0, 125]) cube(250, center=true);
  bagHolder();
}