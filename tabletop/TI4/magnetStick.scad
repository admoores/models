include <./magnetHexHolder.scad>

stickHeight = 65;
indicatorRadius = 2.5;
stickRadius = 4.5;
markerOffset = 10;
textSize = 4;

markingStyle = 2; // [1: Spheres (one inset one outset), 2: Arrows (this side up)]

/* [Only override if NOT INHERITED] */
magnetHoleDepth = 9;
magnetRadius = 3.9 / 2;

!union() {
  difference() {
    cylinder(r = stickRadius, h = stickHeight);
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
      for (i = [90:90:360]) {
        rotate([0, 0, i]) translate([stickRadius - indicatorRadius, 0, stickHeight / 2]) rotate([0, 90, 0]) linear_extrude(indicatorRadius) text(">> THIS SIDE UP >>", size=textSize, font="Bitstream Vera Sans Mono:style=Bold", halign = "center", valign = "center",);
      }
    }


  }
  if (markingStyle == 1) {
    translate([-stickRadius + indicatorRadius / 2, 0, stickHeight - markerOffset]) sphere(r = indicatorRadius);
  }
}