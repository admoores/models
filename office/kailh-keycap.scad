include <../_constants.scad>

ux = 1.11;
uy = 1.11;
dish = true;
support = true;

/* Post Dimensions */
d1 = 0 + 1.25;
d2 = 0 + 0.75;

dGap = 0 + 4.55;
ctrToCtr = dGap + d1;

h1 = 0 + 2.95;
h2 = 0 + 0.725;

l1 = 0 + 3;

/*Keycap Dimensions*/
xUnit = 18 + 0;
yUnit = 19 + 0;

cornerRadius = 0 + 3;
keySpacing = 0 + .5;
chamfer = 0 + 1.5;
height = 0 + 2;

dishDepth = 0 + .5;
dishInset = 0 + .75;

/* Computed */
xLen = (xUnit * ux) - keySpacing;
yLen = (yUnit * uy) - keySpacing;

module keyCap() {
  translate([0, 0, height / 2 - chamfer/2]) difference() {
    hull() {
      translate([0, 0, -chamfer]) linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2, yLen - cornerRadius*2], center=true);
      translate([0, 0, height - eps]) linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2, yLen - cornerRadius*2], center=true);
      translate([0, 0, height + chamfer - eps * 2]) linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2 - chamfer*2, yLen - cornerRadius*2 - chamfer*2], center=true);
    }
    hull() {
      translate([0, 0, -chamfer - eps]) linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2 - dishInset*2, yLen - cornerRadius*2 - dishInset*2], center=true);
      translate([0, 0, -eps]) linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2 - dishInset*2 - chamfer*2, yLen - cornerRadius*2 - dishInset*2 - chamfer*2], center=true);
    }
    if (dish) {
      hull() {
        translate([0, 0, height + chamfer - dishDepth]) linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2 - chamfer*2 - dishInset*4, yLen - cornerRadius*2 - chamfer*2 - dishInset*4], center=true);
        translate([0, 0, height + chamfer]) linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2 - chamfer*2 - dishInset*2, yLen - cornerRadius*2 - chamfer*2 - dishInset*2], center=true);
      }
    }
  }
}

module post(x = 0, y = 0, z = 0) {
  translate([x, y, z - l1/2]) {
    cube([d2, h1, l1], center = true);
    translate([0, h1/2 - h2/2, 0]) cube([d1, h2, l1], center=true);
    translate([0, -h1/2 + h2/2, 0]) cube([d1, h2, l1], center=true);
  }
}

module fullKeyCap() {
  keyCap();
  post(x = ctrToCtr/2, z=eps);
  post(x = -ctrToCtr/2, z=eps);
}

module supportBlock() {

}

fullKeyCap();
#if (support) supportBlock();


// /* Post Dimensions */
// d1 = 0 + 1.25;
// d2 = 0 + 0.75;

// dGap = 0 + 4.55;
// ctrToCtr = dGap + d1;

// h1 = 0 + 2.95;
// h2 = 0 + 0.725;

// l1 = 0 + 2.5;

// /* Keycap Dimensions */
// unit = 0 + 17;
// edgeGap = 0 + .25;
// radius = 0 + 1.25;
// thickness = 0 + 2.5;

// chamferBottom = 0 + 0.75;
// chamferTop = 0 + 0.75;

// dishInset = 0 + 0.5;
// dishDepth = 0 + 0.25;

// /* Support Block */
// supportHeight = 0 + 5;
// supportOffset = 0 + 1;
// tipContactRad = 0 + 0.2;
// supportSpacing = 0 + 1;

// /* Configuration */
// dish = true; // Whether or not to include the dish element;
// unitX = 1.25; // Units in length
// unitY = 1.25; // Units in height

// xDim = (unitX * unit) - 2*edgeGap;
// yDim = (unitY * unit) - 2*edgeGap;

// supportBrick = true;
// supportTool = false;

// module post(x = 0, y = 0, z = 0) {
//   translate([x, y, z - l1/2]) {
//     cube([d2, h1, l1], center = true);
//     translate([0, h1/2 - h2/2, 0]) cube([d1, h2, l1], center=true);
//     translate([0, -h1/2 + h2/2, 0]) cube([d1, h2, l1], center=true);
//   }
// }

// module keyCap(x = 0, y = 0, z = 0) {
//   t1 = thickness - chamferBottom - chamferTop;

//   x1 = xDim - 2*radius;
//   y1 = yDim - 2*radius;

//   x2 = x1 - 2*chamferBottom;
//   y2 = y1 - 2*chamferBottom;

//   x3 = x1 - 2*chamferTop;
//   y3 = y1 - 2*chamferTop;

//   x4 = x3 - 2*dishInset;
//   y4 = y3 - 2*dishInset;

//   x5 = x4 - 2*dishDepth;
//   y5 = y4 - 2*dishDepth;
//   translate([x, y, z + thickness / 2]) difference() {
//     hull() {
//       translate([0, 0, -thickness/2 + chamferBottom]) linear_extrude(t1) offset(radius) square([x1, y1], center = true);
//       translate([0, 0, -thickness / 2]) linear_extrude(eps) offset(radius) square([x2, y2], center=true);
//       translate([0, 0, thickness / 2 - eps]) linear_extrude(eps) offset(radius) square([x3, y3], center=true);
//     }
//     if (dish) {
//       translate([0, 0, thickness / 2 - dishDepth]) hull() {
//         translate([0, 0, dishDepth]) linear_extrude(eps) offset(radius) square([x4, y4], center=true);
//         linear_extrude(eps) offset(radius) square([x5, y5], center=true);
//       }
//     }
//   }
// }

// module fullKeyCap() {
//   keyCap();
//   post(x = ctrToCtr/2, z=eps);
//   post(x = -ctrToCtr/2, z=eps);
// }

// module attachmentPoint() {
//   translate([0, 0, -eps]) cylinder(r1 = supportSpacing / 2, r2 = tipContactRad, h=supportOffset + eps);
// }

// x1 = xDim - 2*radius - chamferBottom*2;
// y1 = yDim - 2*radius - chamferBottom*2;

// if (supportTool) translate([0, 0, -supportHeight]) {
//   for (x = [-x1/3, x1/3]) for (y = [-y1/3, y1/3]) {
//     translate([x, y, 0]) cylinder(r = 1.25, h = supportHeight);
//     translate([x, y, supportHeight]) sphere(r=1.25);
//   }
//   cylinder(r = 1.25, h = supportHeight);
//   translate([0, 0, supportHeight]) sphere(r=1.25);
//   translate([0, 0, -supportHeight/3 + eps]) hull() {
//     linear_extrude(eps) offset(radius) square([x1, y1], center=true);
//     translate([0, 0, supportHeight/3 - eps]) linear_extrude(eps) offset(radius) square([xDim, yDim], center=true);
//   }
// } else union() {
//   fullKeyCap();

//   if (supportBrick) {

//     difference() {
//       union() {
//         translate([0, 0, -supportHeight]) hull() {
//           linear_extrude(eps) offset(radius) square([x1, y1], center=true);
//           translate([0, 0, supportHeight - supportOffset]) linear_extrude(eps) offset(radius) square([x1, yDim + 2.5], center=true);
//         }
//       }

//       for (xC = [-ctrToCtr/2, ctrToCtr/2]) {
//         translate([xC, 0, -l1 - supportOffset]) cylinder(r=h1 * .65, h = l1 + supportOffset + eps);
//       }

//       cylinder(r = 1.5, h = 25, center = true);
//       for (x = [-x1/3, x1/3]) for (y = [-y1/3, y1/3]) {
//           translate([x, y, 0]) cylinder(r = 1.5, h = 25, center = true);
//       }
//     }

//     //Attachment points
//     union() {
//       ax = xDim - .75 - 2*radius;
//       ay = yDim - .75 - 2*radius;

//       for(x=[-d1/2, d1/2]) for (y=[-h1/2, h1/2, h1/2-h2, -h1/2+h2]) for(xC=[-ctrToCtr/2, ctrToCtr/2]) translate([x +xC, y, -l1 - supportOffset]) attachmentPoint();

//       for(x=[-ax/2+supportSpacing:supportSpacing:ax/2-supportSpacing]) for(y=[-ay/2,-h1*.75,h1*.75,ay/2]) translate([x, y, -supportOffset]) attachmentPoint();
//       for(x=[-ax/5:supportSpacing:ax/5]) for(y=[-ay/3 + 1,ay/3 + 1,-ay/3 - 1,ay/3 - 1]) translate([x, y, -supportOffset]) attachmentPoint();
//       for(x=[-ax/2,ax/2]) for(y=[-ay/2:supportSpacing:ay/2]) translate([x, y, -supportOffset]) attachmentPoint();
//     }
//   }
// }

// /* Support Removal Tool */
// // !difference() {
// //   cube([unit + 12, unit * 1.5, 12], center=true);
// //   translate([0, 0, 4]) cube([unit + .5, unit *1.5 + eps, 12], center=true);
// // }