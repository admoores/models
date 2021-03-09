include <./_common.scad>;

difference() {
  translate([0, 0, -totalHeight]) cube([totalWidth, totalLen, totalHeight]);
  union() {
    translate([solderSuckerLen / 2 + wallThickness, totalLen - wallThickness - solderSuckerWidth / 2, -solderSuckerWidth / 2]) rotate([90, 0, 90]) cylinderSlot(solderSuckerWidth / 2, solderSuckerLen);
    translate([handleWidth / 2 + wallThickness, handleLen / 2 + wallThickness, -handleWidth / 2]) rotate([90, 0, 0]) cylinderSlot(handleWidth / 2, handleLen);
    translate([(handleWidth + tipWidth / 2) + wallThickness * 2, tipLen / 2 + wallThickness, -tipWidth / 2]) rotate([90, 0, 0]) cylinderSlot(tipWidth / 2, tipLen);
    translate([(handleWidth + tipWidth / 2 + tipWidth) + wallThickness * 3, tipLen / 2 + wallThickness, -tipWidth / 2]) rotate([90, 0, 0]) cylinderSlot(tipWidth / 2, tipLen);
    translate([solderSuckerLen + wallThickness * 2 + holderWidth / 2, holderLen / 2 + wallThickness, -holderWidth / 2]) rotate([90, 0, 0]) cylinderSlot(holderWidth / 2, holderLen);
    translate([solderSuckerLen + wallThickness * 2 + holderWidth / 2, holderLen / 3 + wallThickness, -(holderWidth / 2) - (holderBaseLen / 2 * sin(45))]) rotate([45, 0, 0]) cylinder(r = holderBaseWidth / 2, h = holderBaseLen * 2, center=true);
    // translate([totalWidth - wallThickness * 2 - holderWidth - spongeHolderWidth, wallThickness, -spongeHolderHeight + .01]) cube([spongeHolderWidth, spongeHolderLen, spongeHolderHeight]);

    translate([wallThickness, -.01, - totalHeight + wallThickness]) cube([handleWidth + 2 * tipWidth + 2 * wallThickness, totalLen - wallThickness, totalHeight - wallThickness * 2 - handleWidth * 1.5]);
    translate([totalWidth - wallThickness - powerBrickSide, -.01, -totalHeight + wallThickness]) cube([powerBrickSide, powerBrickLen + .01 + wallThickness * 2, powerBrickSide]); 
    translate([totalWidth - wallThickness - powerBrickSide - wallThickness * 2, -.01, -totalHeight + wallThickness]) cube([powerBrickSide + wallThickness * 2, wallThickness * 2, powerBrickSide + wallThickness * 2]); 

    translate([handleWidth + tipWidth * 2 + wallThickness * 4, wallThickness, -middleZDim + .01]) cube([middleXDim, middleYDim, middleZDim]);

    // translate([totalWidth - wallThickness * 3 - holderWidth - spongeHolderWidth - helpingHandHoleRad, wallThickness + helpingHandHoleRad, -helpingHandHoleDepth + .01]) cylinder(r = helpingHandHoleRad, h = helpingHandHoleDepth);
    // translate([totalWidth - wallThickness * 3 - holderWidth - spongeHolderWidth - helpingHandHoleRad, wallThickness + spongeHolderLen - helpingHandHoleRad, -helpingHandHoleDepth + .01]) cylinder(r = helpingHandHoleRad, h = helpingHandHoleDepth);
  }
}

module cylinderSlot(r, l) {
  cylinder(r = r, h = l, center=true);
  translate([0, r, 0]) cube([r * 2, r * 2, l], center=true);
  translate([0, r/2, 3 * l / 8]) cube([r * 2, r * 2, l / 4], center=true);
  translate([0, -r/2, 3 * l / 8]) cylinder(r = r, h = l / 4, center=true);
  translate([0, -r/2, l / 4]) sphere(r = r);
  translate([0, r/2, l / 4]) rotate([90, 0, 0]) cylinder(r = r, h = r * 2, center=true);
}