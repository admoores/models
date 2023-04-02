include <../_constants.scad>

// speaker
sp_holeSpacing = (41.5 + 37.8) / 2;
sp_screwRad = 2 / 2;

// audio extracto
as_dimensions = [60.3, 52.4, 14.6];

// power supply
ps_tabSize = 7;
ps_dimensions = [53, 49.7 + ps_tabSize * 2, 19.9];

// audio board
ab_knobShaftRad = 7.05 / 2;
ab_knobHoleHeight = 11.2;
ab_dimensions = [32.3, 55.7, 15];

// type A
a_holeDim = [13.3, 6, 15];

// type C
c_holeDim = [3.4, 1.3, 9.2, 1];
c_portLen = 7.3;
c_boardDim = [5, 12, 11];
c_c2c = c_holeDim.z - c_holeDim.x;

usb_edgeGap = 2.5;

usb_totalWidth = 35;
usb_totalHeight = 22.5;
module usbPanel(hole=false) {

  difference() {
    cube([usb_totalWidth, a_holeDim.y - eps*2, usb_totalHeight]);
    if(!hole) {
      translate([usb_edgeGap, -eps, usb_edgeGap]) cube(a_holeDim);
      translate([usb_totalWidth - usb_edgeGap - c_holeDim.x/2, c_portLen - eps, usb_totalHeight / 2]) {
        translate([0, -c_portLen + c_boardDim.y/2 + c_holeDim.y, 0]) cube(c_boardDim, center = true);
        rotate([90, 0, 0]) linear_extrude(c_portLen) offset(c_holeDim[3]) square([c_holeDim.x - c_holeDim[3] * 2, c_holeDim.z - c_holeDim[3]*2], center=true);
      }
    }
  }

}

// Box
bx_width = 65;
bx_length = 80;
bx_wall = 1.2;

m2_threadRad = 1;
m2_threadDepth = 15;
m2_tabRad = 2.5;
bx_floor = (bx_wall*2 + m2_threadRad*2 + m2_tabRad);

module baseBox(height = 20) {
  cornersY = [-1,1] * (bx_width/2 - m2_threadRad - m2_tabRad);
  cornersZ = [-height / 2 - bx_floor + m2_tabRad, height/2 + m2_tabRad];

  difference() {
    translate([0, 0, -bx_floor/2]) cube([bx_length, bx_width, height + bx_floor], center=true);
    cube([bx_length - bx_wall*2, bx_width - bx_wall*2, height + eps], center = true);
    for(xPos = [-1, 1] * (bx_length/2)) 
      for (yPos = cornersY) 
        translate([xPos, yPos, cornersZ[0] - eps]) rotate([0, 90, 0]) {
          cylinder(r = m2_threadRad, h = m2_threadDepth*2, center = true);
          translate([m2_tabRad/2, 0, 0]) cube([m2_tabRad, m2_tabRad*2, bx_wall*2], center=true);
          cylinder(r = m2_tabRad, h = bx_wall*2, center=true);        
    }
  }
  if(height > 0) for(xPos = [-1, 1] * (bx_length - bx_wall)/2) 
    for (yPos = cornersY) 
      translate([xPos, yPos, height/2 + m2_tabRad]) rotate([0, 90, 0]) difference() {
        union() {
          translate([(m2_tabRad)/2, 0, 0]) cube([(m2_tabRad), (m2_tabRad-tol)*2, bx_wall], center=true);
          cylinder(r = (m2_tabRad - tol), h = bx_wall, center=true); 
        }
        cylinder(r = m2_threadRad, h = m2_threadDepth*2, center = true);
      }
}


module usbBox() {
  usbPanelPos = [-bx_length/2 + bx_wall, bx_width/-2 - eps, -usb_totalHeight/2];
  difference() {
    baseBox(25);
    translate(usbPanelPos) usbPanel(true);
  }
  translate(usbPanelPos) usbPanel();
}

baseBox(0);