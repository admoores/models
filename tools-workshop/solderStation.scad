$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

solderSuckerLen = 155;
solderSuckerWidth = 20;

handleLen = 115;
handleWidth = 19;

tipLen = handleLen;
tipWidth = 12;

holderLen = handleLen;
holderWidth = 14;

holderBaseLen = 15;
holderBaseWidth = 13;

wallThickness = 5;

totalHeight = 65;

totalWidth = 225;
totalLen = solderSuckerWidth + handleLen + wallThickness * 3;

spongeHolderWidth = 15;
spongeHolderLen = 30;
spongeHolderHeight = 25;

chargerWidth = 60;
chargerHeight = 30;
chargerLen = 60;

helpingHandHoleRad = 5;

middleXDim = totalWidth - (handleWidth + tipWidth * 2 + wallThickness) - (holderWidth + chargerWidth);
middleYDim = totalLen - wallThickness * 3 - solderSuckerWidth;
middleZDim = totalHeight - wallThickness;

difference() {
  translate([0, 0, -totalHeight]) cube([totalWidth, totalLen, totalHeight]);
  union() {
    translate([solderSuckerLen / 2 + wallThickness, totalLen - wallThickness - solderSuckerWidth / 2, -solderSuckerWidth / 2]) rotate([90, 0, 90]) cylinderSlot(solderSuckerWidth / 2, solderSuckerLen);
    translate([handleWidth / 2 + wallThickness, handleLen / 2 + wallThickness, -handleWidth / 2]) rotate([90, 0, 0]) cylinderSlot(handleWidth / 2, handleLen);
    translate([(handleWidth + tipWidth / 2) + wallThickness * 2, tipLen / 2 + wallThickness, -tipWidth / 2]) rotate([90, 0, 0]) cylinderSlot(tipWidth / 2, tipLen);
    translate([(handleWidth + tipWidth / 2 + tipWidth) + wallThickness * 3, tipLen / 2 + wallThickness, -tipWidth / 2]) rotate([90, 0, 0]) cylinderSlot(tipWidth / 2, tipLen);
    translate([totalWidth - wallThickness - holderWidth / 2, holderLen / 2 + wallThickness, -holderWidth / 2]) rotate([90, 0, 0]) cylinderSlot(holderWidth / 2, holderLen);
    translate([totalWidth - wallThickness - holderWidth / 2, holderLen / 2 + wallThickness, -(holderWidth / 2) - (holderBaseLen * sin(45))]) rotate([45, 0, 0]) cylinder(r = holderBaseWidth / 2, h = holderBaseLen * 2, center=true);
    translate([totalWidth - wallThickness * 2 - holderWidth - spongeHolderWidth, wallThickness, -spongeHolderHeight + .01]) cube([spongeHolderWidth, spongeHolderLen, spongeHolderHeight]);
    translate([totalWidth - wallThickness * 2 - holderWidth - chargerHeight, spongeHolderLen + wallThickness * 2 + chargerHeight / 2, -chargerLen + .01]) cube([chargerHeight, chargerWidth, chargerLen]);
    translate([totalWidth - wallThickness * 2 - holderWidth - chargerHeight / 2, spongeHolderLen + wallThickness * 2 + chargerHeight / 2, -.01]) sphere(r=chargerHeight / 2);
    translate([totalWidth - wallThickness * 2 - holderWidth - chargerHeight / 2, spongeHolderLen + wallThickness * 2 + chargerHeight / 2 + chargerLen, -.01]) sphere(r=chargerHeight / 2);

    translate([handleWidth + tipWidth * 2 + wallThickness * 4, wallThickness, -middleZDim + .01]) cube([middleXDim, middleYDim, middleZDim]);

    translate([totalWidth - wallThickness * 3 - holderWidth - spongeHolderWidth - helpingHandHoleRad, wallThickness + helpingHandHoleRad, -totalHeight + wallThickness + .01]) cylinder(r = helpingHandHoleRad, h = totalHeight - wallThickness);
    translate([totalWidth - wallThickness * 3 - holderWidth - spongeHolderWidth - helpingHandHoleRad, wallThickness + spongeHolderLen - helpingHandHoleRad, -totalHeight + wallThickness + .01]) cylinder(r = helpingHandHoleRad, h = totalHeight - wallThickness);
  }
}

module cylinderSlot(r, l) {
  cylinder(r = r, h = l, center=true);
  translate([0, r, 0]) cube([r * 2, r * 2, l], center=true);
  translate([0, 0, 3 * l / 8]) cube([r * 2, r * 2, l / 4], center=true);
  translate([0, -r, 3 * l / 8]) cylinder(r = r, h = l / 4, center=true);
  translate([0, -r, l / 4]) sphere(r = r);
  translate([0, 0, l / 4]) rotate([90, 0, 0]) cylinder(r = r, h = r * 2, center=true);
}