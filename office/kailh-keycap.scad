include <../_constants.scad>

/* [Dimensions] */
// KB units wide
xUnits = 0.99;
// KB units tall
yUnits = 0.99; 

/* [Support Options] */
// Include integrated support block
support = true;
// Create support tool (Key will not be rendered)
supportTool = false;

/* [Top Options] */
variant = 2; // [0: Custom Child, 1: Basic, 2: Basic Dished]

/* [Key Slant] */
slantAngle = 2.5;
slantDir = 1; // [0: x, 1: y]

/* Post Dimensions */
postWidth = 0 + 1.25;
postWaist = 0 + 0.75;

dGap = 0 + 4.55;
ctrToCtr = dGap + postWidth;

postHeight1 = 0 + 2.95;
postHeight2 = 0 + 0.725;

postHeight = 0 + 3.5;

/*Keycap Dimensions*/
xUnit = 18 + 0;
yUnit = 17 + 0;

cornerRadius = 0 + 5;
keySpacing = 0 + 1;
bottomDish = 0 + 2;
bottomRim = 0 + 0.5;

topDish = 0 + .75;
topRim = 0 + .5;

baseThickness = 0 + 2.5;
topHeight = 0 + 1;

supportHeight = 0 + 2.5;
supportOffset = 0 + 1.5;
supportRad = 0 + .6;
supportSpacing = 0 + 2.4;
supportRemovalTab = 0 + 2.5;
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
    slantLen = (slantDir == 0 ? xLen : yLen) * (1/cos(slantAngle));
    translate([0, 0, (slantLen * sin(slantAngle))/2])
      rotate([slantDir == 1 ? slantAngle : 0, slantDir == 0 ? slantAngle : 0, 0])
        scale([slantDir == 0 ? 1/cos(slantAngle) : 1, slantDir == 1 ? 1/cos(slantAngle) : 1, 1])
          union() {
            if (variant == 1 || variant == 2) union() {
              translate([0, 0, -slantLen/2]) cube([xLen, yLen, slantLen], center=true);
              difference() {
                hull() {
                  linear_extrude(eps) radiusRectangle();
                  translate([0, 0, topHeight-eps]) linear_extrude(eps) radiusRectangle(x=xLen-topHeight*2, y=yLen-topHeight*2);
                }
                if (variant == 2) hull() {
                  outerInset = topRim + topHeight;
                  innerInset = topRim + topDish + topHeight;
                  translate([0, 0, topHeight]) linear_extrude(eps) radiusRectangle(x=xLen-outerInset*2, y=yLen-outerInset*2);
                  translate([0, 0, topHeight - topDish]) linear_extrude(eps) radiusRectangle(x=xLen-innerInset*2, y=yLen-innerInset*2);
                }
              }
            } else if (variant == 0) children();
    }
    translate([0, 0, -eps]) linear_extrude(100) radiusRectangle();
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
      // translate([0, 0, -supportHeight]) linear_extrude(supportHeight) radiusRectangle(x=xLen+supportRemovalTab*2, y=yLen/2, r=supportRemovalTab);
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
      for(x = [supportSpacing/2:supportSpacing:xLen/2 - bottomDish/2 - supportSpacing])
        for(y=[supportSpacing/2:supportSpacing:yLen/2 - bottomDish/2 - supportSpacing])
          for(iy=[-1,1]) for(ix=[-1,1])
            if (y >= postHeight1/2+supportSpacing/2 || x>=ctrToCtr/2+supportSpacing/2) 
              translate([x*ix, y*iy, 0]) supportRod(postHeight);
      for(y=[-yLen/2 + cornerRadius/(sqrt(2)*2), yLen/2 - cornerRadius/(sqrt(2)*2)])
        for(x=[-xLen/2 + cornerRadius/(sqrt(2)*2), xLen/2 - cornerRadius/(sqrt(2)*2)])
          translate([x, y, 0]) supportRod(postHeight - bottomDish);

    }
    cornerInset = cornerRadius + bottomDish + supportToolPostRad;
    cylinder(r = supportToolPostRad, h = 25, center=true);
  }
}

module supportTool() {
  rTol = supportToolPostRad-.25;
  hTot = supportHeight + supportOffset + postHeight + 2.5;
  cylinder(r1 = 15/2, r2 = 17.5/2, h = supportHeight);
  cylinder(r = rTol, h = hTot);
  translate([0, 0, hTot]) cylinder(r1 = rTol, r2 = rTol - .25, h = .25);
}

fullKeyCap();
if (support) supportBlock();

if (supportTool) !supportTool();