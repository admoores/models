include <_common.scad>

barGap = 75;
rackHeight = 50; 

translate([0, rackHeight / 2, 0]) for (i = [-1:2:1]) {
  translate([i * (barGap / 2), 0, 0]) difference() {
    rotate([0, 0, 0]) cylinder(h = (insertDepth), r = holeRad + wallThickness, center = true);
    translate([0, 0, wallThickness]) cylinder(h = (insertDepth) + .2, r = holeRad, center = true);
    rotate([0, -90, 0]) translate([-insertDepth / 2 + wallThickness * 2 , 0, 0]) rotate([0, -90, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, wallThickness + 1, wallThickness / 2);
  }
}

translate([0, -rackHeight / 2, 0]) for (i = [-1:2:1]) {
  translate([i * (barGap / 2), 0, 0]) difference() {
    rotate([0, 0, 0]) cylinder(h = (insertDepth), r = holeRad + wallThickness, center = true);
    translate([-holeRad - wallThickness, -holeRad - wallThickness, -insertDepth / 2 - .5]) cube([(holeRad + wallThickness) * 2, (holeRad + wallThickness * 2), insertDepth + 1]);
  }
}

translate([-barGap / 2 - wallThickness, (rackHeight - holeRad * 2 + wallThickness) / -2, insertDepth / -2]) cube([wallThickness * 2, rackHeight - holeRad * 2, insertDepth]);
translate([barGap / 2 - wallThickness, (rackHeight - holeRad * 2 + wallThickness) / -2, insertDepth / -2]) cube([wallThickness * 2, rackHeight - holeRad * 2, insertDepth]);

crossmemberLength = sqrt(pow(barGap, 2) + pow(rackHeight, 2)) - holeRad * 2 - wallThickness * 1.5;
rotate([0, 0, atan(rackHeight / barGap)]) translate([crossmemberLength / -2, -wallThickness, -insertDepth / 2]) cube([crossmemberLength, wallThickness * 2, insertDepth]);
rotate([0, 0, -atan(rackHeight / barGap)]) translate([crossmemberLength / -2, -wallThickness, -insertDepth / 2]) cube([crossmemberLength, wallThickness * 2, insertDepth]);