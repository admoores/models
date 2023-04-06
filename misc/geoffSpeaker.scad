include <../_constants.scad>

part = 2; // [0: Lid, 1: Body, 2: Extractor Bracket]

// base
componentSpacing = 5 * 1;
panelThickness = 2 * 1;

boxDimensions = [120, 100, 25] * 1;
totalHeight = boxDimensions.z - panelThickness;

legThickness = 6 * 1;
legAddedHeight = 45 * 1;
legAngle = 30 * 1;

speakerWireHole = 3 * 1;

// M3 Screw
m3_threadRad = 1.45 * 1;
m3_headRad = 2.2 * 1;

// speaker
sp_holeSpacing = (41.5 + 37.8) / 2;
sp_screwRad = 2 / 2;

// audio extracto
as_dimensions = [60.3, 52.4, 14.6] * 1;

// power supply
ps_tabSize = 7 * 1;
ps_dimensions = [53, 49.7 + ps_tabSize * 2, 19.9] * 1;

// audio board
ab_knobShaftRad = 7.05 / 2;
ab_knobHoleHeight = 11.2 * 1;
ab_dimensions = [55.7, 32.3, 15] * 1;

// type A
a_holeDim = [13.3, 6, 15] * 1;

// type C
c_holeDim = [3.4, 1.3, 9.2, 1] * 1;
c_portLen = 7.3 * 1;
c_boardDim = [5, 12, 11] * 1;
c_c2c = c_holeDim.z - c_holeDim.x;

usb_edgeGap = 5 * 1;

usb_totalWidth = 40 * 1;
usb_totalHeight = totalHeight;
module usbPanel(hole=false) {

  difference() {
    cube([usb_totalWidth, a_holeDim.y - eps*2, usb_totalHeight]);
    if(!hole) {
      translate([usb_edgeGap, -eps, usb_totalHeight / 2 - a_holeDim.z/2]) cube(a_holeDim);
      translate([usb_totalWidth - usb_edgeGap - c_holeDim.x/2, c_portLen - eps, usb_totalHeight / 2]) {
        translate([0, -c_portLen + c_boardDim.y/2 + c_holeDim.y, 0]) cube(c_boardDim, center = true);
        rotate([90, 0, 0]) linear_extrude(c_portLen) offset(c_holeDim[3]) square([c_holeDim.x - c_holeDim[3] * 2, c_holeDim.z - c_holeDim[3]*2], center=true);
      }
    }
  }
}


module volumePanel() {
  difference() {
    cube([ab_dimensions.x, panelThickness, totalHeight]);
    translate([ab_dimensions.x/2, panelThickness+eps, ab_knobHoleHeight]) rotate([90, 0, 0]) cylinder(r = ab_knobShaftRad, h = panelThickness + eps*2);
  }
}

module componentSpacer(xPos) {
  translate([xPos - eps, 0, 0]) {
    cube([componentSpacing + eps*2, panelThickness, totalHeight]);
  }
}

panelWidth = ab_dimensions.x + componentSpacing + usb_totalWidth;
module frontPanel() {
  translate([ab_dimensions.x + componentSpacing - panelWidth/2, 0, 0]) {
    usbPanel();
    componentSpacer(-componentSpacing);
    translate([-ab_dimensions.x - componentSpacing, 0, 0]) volumePanel();
  }
}

module mainBox() {
  translate([0, boxDimensions.y/2, 0]) {
    translate([0, 0, boxDimensions.z/2 -panelThickness]) difference() { 
      cube(boxDimensions, center=true);
      translate([0, 0, panelThickness]) cube([boxDimensions.x - panelThickness*2, boxDimensions.y-panelThickness*2, boxDimensions.z], center=true);
      translate([0, -panelThickness-eps, panelThickness]) cube([panelWidth-eps*2, boxDimensions.y, boxDimensions.z], center=true);
      for(ix = [-1, 1] * (as_dimensions.x + panelThickness*2 + m3_threadRad)/2) translate([ix, 0, 0]) {
        cylinder(r = m3_threadRad, h=boxDimensions.z*2, center=true);
        translate([0, boxDimensions.y/4, 0]) cylinder(r = speakerWireHole, h=boxDimensions.z*2, center=true);
      }
    }
    for(ix = [-1, 1] * (boxDimensions.x/2 - panelThickness -m3_threadRad)) for(iy = [-1, 1] * (boxDimensions.y/4 - panelThickness -m3_threadRad)) translate([ix, iy, 0]) difference() {
      cylinder(r = m3_threadRad*2, h=boxDimensions.z-panelThickness);
      cylinder(r = m3_threadRad, h=boxDimensions.z);
    }

  }
}

module lid() {
  difference() {
    union() {
      for (im = [0, 1]) mirror([im, 0, 0]) translate([boxDimensions.x/2, -boxDimensions.y/4, 0]) {
        rotate([0, legAngle, 0]) difference() {
          cube([legThickness, boxDimensions.y/2, boxDimensions.z + legAddedHeight*1.5]);
          for(iy = [-1, 1]*sp_holeSpacing/2) for(iz = [-1, 1]*sp_holeSpacing/2) translate([-legThickness/2, boxDimensions.y/4 + iy, boxDimensions.z/2 + legAddedHeight/2+ iz]) rotate([0, 90, 0]) cylinder(r = sp_screwRad, h=legThickness * 2);

          // TEMPORARY
          // #rotate([0, -legAngle, 0]) translate([-boxDimensions.x, -boxDimensions.y, boxDimensions.z + legAddedHeight]) cube(boxDimensions*2);
          // TEMPORARY
        }
        intersection() {
          translate([0, boxDimensions.y/2, 0]) rotate([90, 0, 0]) cylinder(r = legThickness, h=boxDimensions.y/2);
          translate([0, 0, -50 + panelThickness]) cube([100, 100, 100], center = true);
        }
        // for(iy = [-1, 1] * (boxDimensions.y/4)) translate([0, boxDimensions.y/4 + iy, -panelThickness]) cylinder(r=legThickness, h=panelThickness*2);
      }
      cube([boxDimensions.x, boxDimensions.y, panelThickness*2], center=true);
    }
    for(ix = [-1, 1] * (boxDimensions.x/2 - panelThickness -m3_threadRad))  {
      translate([ix * .75, 0, 0]) cylinder(r = speakerWireHole, h = panelThickness*3, center=true);
      for(iy = [-1, 1] * (boxDimensions.y/4 - panelThickness -m3_threadRad)) translate([ix, iy, 0]) {
        cylinder(r = m3_threadRad, h=boxDimensions.z, center=true);
        translate([0, 0, -panelThickness/2 - eps]) cylinder(r = m3_headRad, h = panelThickness+eps, center=true);
      }
    }
    translate([-boxDimensions.x, -boxDimensions.y, boxDimensions.z + legAddedHeight]) cube(boxDimensions*2);
    translate([-boxDimensions.x, -boxDimensions.y, -boxDimensions.z*2 - panelThickness]) cube(boxDimensions*2);
  }
}


bracketWidth = 10;

module extractorBracket() {
  difference() {
    union() {
      cube([as_dimensions.x + panelThickness*2, bracketWidth, as_dimensions.z + panelThickness], center = true);
      for(ix = [-1, 1] * (as_dimensions.x + panelThickness*2 + m3_threadRad)/2) translate([ix, 0, (as_dimensions.z + panelThickness)/2 - panelThickness]) cylinder(r = bracketWidth/2, h = panelThickness);
    }
    translate([0, 0, panelThickness/2 + eps]) cube(as_dimensions, center = true);

    for(ix = [-1, 1] * (as_dimensions.x + panelThickness*2 + m3_threadRad)/2) translate([ix, 0, 0]) {
      cylinder(r = m3_threadRad, h=as_dimensions.z + panelThickness + eps*2, center=true);
      translate([0, 0, -panelThickness/2 - eps]) cylinder(r = m3_headRad, h=as_dimensions.z + eps, center=true);
    }
  }
}

if (part == 0) {
  lid();
} else if (part == 1) {
  mainBox();
  frontPanel();
} else if (part == 2) {
  extractorBracket();
}