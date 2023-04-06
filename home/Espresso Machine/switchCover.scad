include <../../_constants.scad>

// XY plane is outer face of machine?

holeHeight = 22.2;
holeWidth = 30.25;

plugDepth = 5;
faceThickness = 3;
faceRim = 2.5;

switchBodyRad = 19.3/2;
switchBodyLen = 11.8;
switchLipRad = 22.7/2;
switchLipHeight = 2;
rockerHeight = 3.6;
indexWidth = 2.15;
indexThickness = 1.3;
retainerWidth = 3.6;
retainerDepth = 22.8;
retainerCatch = 0;

hingeWidth = 6;
hingePinRad = 1;

magnetRad = 2.5;
magnetDepth = 2.5;

module switchBody() {
  translate([0, 0, -switchBodyLen]) {
    cylinder(r = switchBodyRad, h = switchBodyLen + eps);
    translate([0, 0, switchBodyLen]) cylinder(r = switchLipRad, h=switchLipHeight);
    translate([0, 0, switchBodyLen + switchLipHeight - eps]) cylinder(r = switchBodyRad, h=rockerHeight + eps);
    translate([-indexWidth/2, indexThickness, 0]) cube([indexWidth, switchBodyRad, switchBodyLen]);
    translate([-retainerDepth/2, -retainerWidth/2, 0]) cube([retainerDepth, retainerWidth, switchBodyLen - retainerCatch]);
  }
}


module switchCoverBody(supports = false) {
  difference () {
    union () {
      translate([0, 0, -plugDepth/2]) cube([holeHeight, holeWidth, plugDepth], center = true);
      translate([0, 0, faceThickness/2]) cube([holeHeight + faceRim*2, holeWidth + faceRim*2, faceThickness], center = true);
      translate([-holeHeight/2 - faceRim, holeWidth/2 + faceRim - hingeWidth, faceThickness]) difference() {
        union() {
          cube([holeHeight + faceRim * 2, hingeWidth, hingeWidth/2]);
          translate([0, hingeWidth/2, hingeWidth/2]) rotate([0, 90, 0]) cylinder(r = hingeWidth/2, h=holeHeight + faceRim*2);
        }
        translate([-eps, hingeWidth/2, hingeWidth/2]) rotate([0, 90, 0]) cylinder(r = hingePinRad, h=holeHeight + faceRim*2 + eps * 2);
        translate([(holeHeight + faceRim * 2) / 3, -eps, 0]) cube([(holeHeight + faceRim * 2) / 3, hingeWidth + eps * 2, hingeWidth + eps]);
      }
    }
    rotate([0, 0, 90]) translate([0, 0, faceThickness + eps]) switchBody();
    
    translate([-(holeHeight + faceRim*2)/2 + magnetRad + faceRim, -(holeWidth + faceRim*2)/2 + faceRim + magnetRad, faceThickness - magnetDepth + eps]) cylinder(r = magnetRad, h = magnetDepth);
    translate([(holeHeight + faceRim*2)/2 - magnetRad - faceRim, -(holeWidth + faceRim*2)/2 + faceRim + magnetRad, faceThickness - magnetDepth + eps]) cylinder(r = magnetRad, h = magnetDepth);
  }

  if (supports) {
    supportGap = .3;
    difference() {
      translate([0, 0, -plugDepth/2 - supportGap/2]) cube([holeHeight + faceRim*2, holeWidth + faceRim*2, plugDepth - supportGap], center = true);
      translate([0, 0, -plugDepth/2 - supportGap/2]) cube([holeHeight + supportGap*2, holeWidth + supportGap*2, plugDepth], center = true);
      cube([100, supportGap, 25], center=true);
      cube([supportGap, 100, 25], center=true);
    }
  }
}


hingePlay = .5;
switchPusherRad = 2;
switchPusherHeight = 2.5;
lidSwitchHoleRad = switchLipRad + 1;

module switchLid() {
  hull() {
    linear_extrude(eps) square([holeHeight, holeWidth], center = true);
    translate([0, 0, faceRim-eps]) linear_extrude(eps) square([holeHeight + faceRim*2, holeWidth + faceRim*2], center = true);
  }
  translate([-holeHeight/2 - faceRim, holeWidth/2 + faceRim - hingeWidth, faceRim]) {
    intersection() {
      difference() {
        union() {
          cube([holeHeight + faceRim * 2, hingeWidth, hingeWidth/2]);
          translate([0, hingeWidth/2, hingeWidth/2]) rotate([0, 90, 0]) cylinder(r = hingeWidth/2, h=holeHeight + faceRim*2);
        }
        translate([-eps, hingeWidth/2, hingeWidth/2]) rotate([0, 90, 0]) cylinder(r = hingePinRad, h=holeHeight + faceRim*2 + eps * 2);
      }
      translate([(holeHeight + faceRim * 2) / 3, -eps, 0]) cube([(holeHeight + faceRim * 2) / 3 - hingePlay, hingeWidth + eps * 2, hingeWidth + eps]);
    }
  }
  translate([0, -switchBodyRad/2, faceRim]) {
    cylinder(r = switchPusherRad, h = switchPusherHeight - switchPusherRad);
    translate([0, 0, switchPusherHeight - switchPusherRad]) sphere(r = switchPusherRad);
  }
  translate([0, 0, faceRim + hingeWidth/2]) difference() {
    cube([holeHeight + faceRim*2, holeWidth + faceRim*2, hingeWidth], center=true);
    translate([0, holeWidth/2, 0]) cube([lidSwitchHoleRad*2, holeWidth, hingeWidth + eps*2], center=true);
    cylinder(r = lidSwitchHoleRad, h = 10, center=true);
    translate([-(holeHeight + faceRim*2)/2 + magnetRad + faceRim, -(holeWidth + faceRim*2)/2 + faceRim + magnetRad, hingeWidth/2 - magnetDepth + eps]) cylinder(r = magnetRad, h = magnetDepth);
    translate([(holeHeight + faceRim*2)/2 - magnetRad - faceRim, -(holeWidth + faceRim*2)/2 + faceRim + magnetRad, hingeWidth/2 - magnetDepth + eps]) cylinder(r = magnetRad, h = magnetDepth);
    translate([0, (holeWidth + faceRim*2)/2 - hingeWidth/2 + eps, -hingeWidth/2]) hull() {
      linear_extrude(eps) square([holeHeight + faceRim*2 + eps*2, hingeWidth], center=true);
      translate([0, -hingeWidth/2, hingeWidth]) linear_extrude(eps) square([holeHeight + faceRim*2 + eps*2, hingeWidth*2], center=true);
    }
  }
}

switchCoverBody();

// switchLid();