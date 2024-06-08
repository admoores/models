include <./magnetHexHolder.scad>

stickHeight = 100;
indicatorRadius = 1.35;
stickRadius = 6;
markerOffset = 10;
textSize = 8;

chamferHeight = 3;

markingStyle = 2; // [1: Spheres (one inset one outset), 2: Arrows (this side up)]

/* [Only override if NOT INHERITED] */
magnetHoleDepth = 10;
magnetRadius = 3.8 / 2;

!union() {
  difference() {
    union() {
      translate([0, 0, chamferHeight]) cylinder(r = stickRadius, h = stickHeight - chamferHeight*2);
      cylinder(r1 = stickRadius - chamferHeight, r2 = stickRadius, h = chamferHeight);
      translate([0, 0, stickHeight - chamferHeight]) cylinder(r2 = stickRadius - chamferHeight, r1 = stickRadius, h = chamferHeight);
    }
    translate([0, 0, -.001]) {
      cylinder(r = magnetRadius, h = magnetHoleDepth);
      cylinder(r1 = magnetTopChamferRadius, r2 = 0, h = magnetTopChamferRadius);
      translate([0, 0, magnetHoleDepth - magnetBottomChamferRadius]) cylinder(r1 = 0, r2 = magnetBottomChamferRadius, h = magnetBottomChamferRadius);
    }

    translate([0, 0, stickHeight + .001 - magnetHoleDepth]) {
      cylinder(r = magnetRadius, h = magnetHoleDepth);
      cylinder(r1 = magnetBottomChamferRadius, r2 = 0, h = magnetBottomChamferRadius);
      translate([0, 0, magnetHoleDepth - magnetTopChamferRadius]) cylinder(r1 = 0, r2 = magnetTopChamferRadius, h = magnetTopChamferRadius);
    }

    if (markingStyle == 1) {
      translate([stickRadius - indicatorRadius / 2, 0, markerOffset]) sphere(r = indicatorRadius);
    } else if (markingStyle == 2) {
      for (i = [90:180:360]) {
        rotate([0, 0, i]) translate([stickRadius - indicatorRadius, 0, stickHeight / 2]) rotate([0, 90, 0]) linear_extrude(indicatorRadius) text(">>--------->>", size=textSize, font="Bitstream Vera Sans Mono:style=Bold", halign = "center", valign = "center",);
      }
    }


  }
  if (markingStyle == 1) {
    translate([-stickRadius + indicatorRadius / 2, 0, stickHeight - markerOffset]) sphere(r = indicatorRadius);
  }
}