include <../../_constants.scad>

width = 26;
thickness = 2.5;
length = 162;

tabThickness = 3.5;
tabDepth = 2.5;
tabLength = 23.5;

difference() {
    union() {
        cylinder(r = width/2, h=length);
        translate([-width/2, 0, 0]) cube([width, width/2, length]);
    }

    translate([0, 0, -eps]) union() {
        cylinder(r = width/2 - thickness, h=length + 2*eps);
        translate([-width/2 + thickness, 0, 0]) cube([width - thickness*2, width/2 - tabDepth, length + 2*eps]);
        translate([-width/2 + thickness, 0, tabLength]) cube([width - thickness*2, width/2 + eps, length - tabLength * 2]);
        translate([-width/2 + tabThickness, 0, -eps]) cube([width - thickness - tabThickness, width/2 + eps, tabLength + eps*2]);
        translate([-width/2 + thickness, 0, length - tabLength - eps]) cube([width - thickness - tabThickness, width/2 + eps, tabLength + eps * 3]);
    }
}

