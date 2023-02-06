include <../_constants.scad>

/* Post Dimensions */
d1 = 0 + 1.25;
d2 = 0 + 0.75;

dGap = 0 + 4.55;
ctrToCtr = dGap + d1;

h1 = 0 + 2.95;
h2 = 0 + 0.725;

l1 = 0 + 3;

/* Keycap Dimensions */
unit = 0 + 17;
edgeGap = 0 + .25;
radius = 0 + 1.25;
thickness = 0 + 3;

chamferBottom = 0 + 1;
chamferTop = 0 + 0.75;

dishInset = 0 + 0.5;
dishDepth = 0 + 0.25;

/* Support Block */
supportHeight = 0 + 5;
supportOffset = 0 + 1;
tipContactRad = 0 + 0.3;
supportSpacing = 1;
layer=.05;

/* Configuration */
dish = true; // Whether or not to include the dish element;
unitX = 1.25; // Units in length
unitY = 1.25; // Units in height

xDim = (unitX * unit) - 2*edgeGap;
yDim = (unitY * unit) - 2*edgeGap;

supportBrick = true;
supportTool = false;

module post(x = 0, y = 0, z = 0) {
  translate([x, y, z - l1/2]) {
    cube([d2, h1, l1], center = true);
    translate([0, h1/2 - h2/2, 0]) cube([d1, h2, l1], center=true);
    translate([0, -h1/2 + h2/2, 0]) cube([d1, h2, l1], center=true);
  }
}

module keyCap(x = 0, y = 0, z = 0) {
  t1 = thickness - chamferBottom - chamferTop;

  x1 = xDim - 2*radius;
  y1 = (unit * unitY) - 2*radius;

  x2 = x1 - 2*chamferBottom;
  y2 = y1 - 2*chamferBottom;

  x3 = x1 - 2*chamferTop;
  y3 = y1 - 2*chamferTop;

  x4 = x3 - 2*dishInset;
  y4 = y3 - 2*dishInset;

  x5 = x4 - 2*dishDepth;
  y5 = y4 - 2*dishDepth;
  translate([x, y, z + thickness / 2]) difference() {
    hull() {
      translate([0, 0, -thickness/2 + chamferBottom]) linear_extrude(t1) offset(radius) square([x1, y1], center = true);
      translate([0, 0, -thickness / 2]) linear_extrude(eps) offset(radius) square([x2, y2], center=true);
      translate([0, 0, thickness / 2 - eps]) linear_extrude(eps) offset(radius) square([x3, y3], center=true);
    }
    if (dish) {
      translate([0, 0, thickness / 2 - dishDepth]) hull() {
        translate([0, 0, dishDepth]) linear_extrude(eps) offset(radius) square([x4, y4], center=true);
        linear_extrude(eps) offset(radius) square([x5, y5], center=true);
      }
    }
  }
}

module fullKeyCap() {
  keyCap();
  post(x = ctrToCtr/2, z=eps);
  post(x = -ctrToCtr/2, z=eps);
}

module attachmentPoint() {
  cylinder(r = tipContactRad, h=supportOffset - layer*2);
  translate([0, 0, supportOffset-layer*2]) cylinder(r1 = tipContactRad, r2=tipContactRad/2, h=2*layer);
}

x1 = xDim - 2*radius - chamferBottom*2;
y1 = yDim - 2*radius - chamferBottom*2;

if (supportTool) translate([0, 0, -supportHeight]) {
  for (x = [-x1/3, x1/3]) for (y = [-y1/3, y1/3]) {
    translate([x, y, 0]) cylinder(r = 1.25, h = supportHeight);
    translate([x, y, supportHeight]) sphere(r=1.25);
  }
  cylinder(r = 1.25, h = supportHeight);
  translate([0, 0, supportHeight]) sphere(r=1.25);
  translate([0, 0, -supportHeight/3 + eps]) hull() {
    linear_extrude(eps) offset(radius) square([x1, y1], center=true);
    translate([0, 0, supportHeight/3 - eps]) linear_extrude(eps) offset(radius) square([xDim, yDim], center=true);
  }
} else union() {
  fullKeyCap();

  if (supportBrick) {

    difference() {
      union() {
        translate([0, 0, -supportHeight]) hull() {
          linear_extrude(eps) offset(radius) square([x1, y1], center=true);
          translate([0, 0, supportHeight - supportOffset]) linear_extrude(eps) offset(radius) square([xDim + 2.5, y1], center=true);
        }
      }

      for (xC = [-ctrToCtr/2, ctrToCtr/2]) {
        translate([xC, 0, -l1 - supportOffset]) cylinder(r=h1 * .65, h = l1 + supportOffset + eps);
      }

      cylinder(r = 1.5, h = 25, center = true);
      for (x = [-x1/3, x1/3]) for (y = [-y1/3, y1/3]) {
          translate([x, y, 0]) cylinder(r = 1.5, h = 25, center = true);
      }
    }

    // Attachment points
    union() {
      ax = xDim - .75 - 2*radius;
      ay = yDim - .75 - 2*radius;

      for(x=[-d1/2, d1/2]) for (y=[-h1/2, h1/2, h1/2-h2, -h1/2+h2]) for(xC=[-ctrToCtr/2, ctrToCtr/2]) translate([x +xC, y, -l1 - supportOffset]) attachmentPoint();

      for(x=[-ax/2+supportSpacing:supportSpacing:ax/2-supportSpacing]) for(y=[-ay/2,-h1*.75,h1*.75,ay/2]) translate([x, y, -supportOffset]) attachmentPoint();
      for(x=[-ax/6:supportSpacing:ax/6]) for(y=[-ay/3 + 1,ay/3 + 1,-ay/3 - 1,ay/3 - 1]) translate([x, y, -supportOffset]) attachmentPoint();
      for(x=[-ax/2,ax/2]) for(y=[-ay/2:supportSpacing:ay/2]) translate([x, y, -supportOffset]) attachmentPoint();
    }
  }
}

/* Support Removal Tool */
// !difference() {
//   cube([unit + 12, unit, 12], center=true);
//   translate([0, 0, 4]) cube([unit + .5, unit + eps, 12], center=true);
// }