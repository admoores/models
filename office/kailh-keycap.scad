include <../_constants.scad>

// KB units wide
xUnits = 0.99;
// KB units tall
yUnits = 0.99; 
// Include integrated support block
support = true;
supportTool = false;
variant = 2; // [0: Custom Child, 1: Basic, 2: Basic Dished]

/* Post Dimensions */
postWidth = 0 + 1.25;
postWaist = 0 + 0.75;

dGap = 0 + 4.55;
ctrToCtr = dGap + postWidth;

postHeight1 = 0 + 2.95;
postHeight2 = 0 + 0.725;

postHeight = 0 + 3;

/*Keycap Dimensions*/
xUnit = 18 + 0;
yUnit = 17 + 0;

cornerRadius = 0 + 3;
keySpacing = 0 + .5;
bottomDish = 0 + 1.5;
bottomRim = 0 + 0.5;

topDish = 0 + 0.5;
topRim = 0 + 1;

baseThickness = 0 + 2;
topHeight = 0 + 2;

supportHeight = 0 + 2.5;
supportOffset = 0 + 1;
supportRad = 0 + .6;
supportSpacing = 0 + 1.2;
supportRemovalTab = 2.5;
contactRad = 0 + .2;

supportToolPostRad = 0 + 1.5;

/* Computed */
xLen = (xUnit * xUnits) - keySpacing;
yLen = (yUnit * yUnits) - keySpacing;

module radiusRectangle(r = cornerRadius, x=xLen, y=yLen,offset=0) {
  union() {
    xDim = x-r*2;
    yDim = y-r*2;
    square([xDim, y+offset*2], center=true);
    square([x+offset*2, yDim], center=true);
    for (xPos=[xDim/2, -xDim/2]) for(yPos=[yDim/2, -yDim/2]) translate([xPos, yPos]) circle(r=r+offset);
  }
}

module keyCapBase() {
  translate([0, 0, 0]) difference() {
    translate([0, 0, -baseThickness-bottomDish]) linear_extrude(baseThickness+bottomDish) radiusRectangle();
    hull() {
      outerInset = bottomRim;
      innerInset = bottomRim + bottomDish;
      translate([0, 0, -baseThickness-bottomDish-eps]) linear_extrude(eps) radiusRectangle(offset=-bottomRim);
      translate([0, 0, -baseThickness]) linear_extrude(eps) radiusRectangle(offset=-bottomRim-bottomDish);
    }
  }
}

module post(x = 0, y = 0, z = 0) {
  translate([x, y, z - postHeight/2]) {
    cube([postWaist, postHeight1, postHeight], center = true);
    translate([0, postHeight1/2 - postHeight2/2, 0]) cube([postWidth, postHeight2, postHeight], center=true);
    translate([0, -postHeight1/2 + postHeight2/2, 0]) cube([postWidth, postHeight2, postHeight], center=true);
  }
}

module keyCapTop() {
  intersection() {
    union() {
      if (variant == 1 || variant == 2) difference() {
        hull() {
          linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2, yLen - cornerRadius*2], center=true);
          translate([0, 0, topHeight-eps]) linear_extrude(eps) offset(cornerRadius) square([xLen - cornerRadius*2 - topHeight*2, yLen - cornerRadius*2 - topHeight*2], center=true);
        }
        if (variant == 2) hull() {
          outerInset = cornerRadius + topRim + topHeight;
          innerInset = cornerRadius + topRim + topDish + topHeight;
          translate([0, 0, topHeight]) linear_extrude(eps) offset(cornerRadius) square([xLen - outerInset*2, yLen - outerInset*2], center=true);
          translate([0, 0, topHeight - topDish]) linear_extrude(eps) offset(cornerRadius) square([xLen - innerInset*2, yLen - innerInset*2], center=true);
        }
      } else if (variant == 0) children();
    }
    linear_extrude(100) offset(cornerRadius) square([xLen - cornerRadius*2, yLen - cornerRadius*2], center=true);
  }
}

module fullKeyCap() {
  keyCapBase();
  keyCapTop();
  post(x = ctrToCtr/2, z=-baseThickness);
  post(x = -ctrToCtr/2, z=-baseThickness);
}

module supportRod(pillarHeight = 0) {
  union() {
    cylinder(r = supportRad, h = pillarHeight);
    translate([0, 0, pillarHeight]) cylinder(r1 = supportRad, r2 = contactRad, h = supportOffset);
  }
}
module supportBlock() {
  difference() {
    translate([0, 0, -baseThickness - postHeight - supportOffset]) {
      translate([0, 0, -supportHeight]) linear_extrude(supportHeight) radiusRectangle(offset=-bottomRim/2+supportRad);
      translate([0, 0, -supportHeight]) linear_extrude(supportHeight) radiusRectangle(x=xLen+supportRemovalTab*2, y=yLen/2, r=supportRemovalTab);
      translate([0, 0, -supportHeight]) linear_extrude(supportHeight) radiusRectangle(x=xLen/2, y=yLen+supportRemovalTab*2, r=supportRemovalTab);
      for(y = [-yLen/2 + cornerRadius - supportRad:supportSpacing:yLen/2 - cornerRadius + supportRad])
        for(x=[xLen/2 - bottomRim/2,-xLen/2 + bottomRim/2])
          translate([x, y, 0]) supportRod(postHeight - bottomDish);
      for(x = [-xLen/2 + cornerRadius - supportRad:supportSpacing:xLen/2 - cornerRadius + supportRad])
        for(y=[yLen/2 - bottomRim/2,-yLen/2 + bottomRim/2])
          translate([x, y, 0]) supportRod(postHeight - bottomDish);
      for(x=[ctrToCtr/2+(postWidth/2),-ctrToCtr/2+(postWidth/2),ctrToCtr/2-(postWidth/2),-ctrToCtr/2-(postWidth/2)])
        for(y=[-postHeight1/2,-postHeight1/2+postHeight2,postHeight1/2-postHeight2,postHeight1/2])
          translate([x,y,0]) supportRod();
      for(y = [-yLen/2 + cornerRadius:supportSpacing:yLen/2 - cornerRadius])
        for(x=[0, (xLen - ctrToCtr)/2, (xLen - ctrToCtr)/-2])
          translate([x, y, 0]) supportRod(postHeight);
      for(y=[-yLen/2 + cornerRadius/(sqrt(2)*2), yLen/2 - cornerRadius/(sqrt(2)*2)])
        for(x=[-xLen/2 + cornerRadius/(sqrt(2)*2), xLen/2 - cornerRadius/(sqrt(2)*2)])
          translate([x, y, 0]) supportRod(postHeight - bottomDish);

    }
    cornerInset = cornerRadius + bottomDish + supportToolPostRad;
    for (y=[(yLen - ctrToCtr)/2, (yLen - ctrToCtr)/-2])
      for (x=[xLen/2 - cornerInset, -xLen/2 + cornerInset]) translate([x,y,0]) cylinder(r = supportToolPostRad + .25, h=50, center=true);
  }
}

module supportTool() {
  translate([0, 0, -supportHeight -baseThickness -postHeight -supportOffset*2]) {
    cornerInset = cornerRadius + bottomDish + supportToolPostRad;
    for (y=[(yLen - ctrToCtr)/2, (yLen - ctrToCtr)/-2])
      for (x=[xLen/2 - cornerInset, -xLen/2 + cornerInset])
      translate([x,y,0]) {
        cylinder(r = supportToolPostRad, h=supportHeight + bottomDish + 2, center=false);
        translate([0, 0, supportHeight + bottomDish + 2]) sphere(r=supportToolPostRad);
      }

  translate([0, 0, -supportHeight]) linear_extrude(supportHeight) radiusRectangle(offset=supportRad/2);
  }
}

fullKeyCap();
if (support) supportBlock();

if (supportTool) !supportTool();