include <../../modules/hexagon.scad>

$fa = 8 + 0;
$fs = 0.25 + 0;


/* [Tile Dimensions] */
// Center to corner of inner recess
innerRadius = 58.1;
// Center to center of edge
tileApothem = (innerRadius * sqrt(3)) / 2;
// Depth of the recess to accept the tile
recessDepth = 2;
// The radius of the relief circles at each corner of the recess
reliefRadius = 1;
// The offset from the tile corner to the outer corner of the holder
outerOffset = 5;
// Offset from center of edge to center of tile
outerApothemOffset = ((innerRadius + outerOffset) * sqrt(3)) / 2;
// The thickness of the base under the tile itself
baseHeight = .4;


/* [Tab] */
tabType = 1; // [0: no tabs (solid base), 1: partial hex tabs, 2: solid lip]
// Radius of circles or width of inset
tabWidth = 5;
// Hex tabs per side of tile. Only applicable if tab type is 1
hexagonsPerSide = 4;

apothemDiff = outerApothemOffset - tileApothem;


/* [Magnet] */
// Magnet Hole Style
magnetHoleStyle = 4; // [0: No holes, 1: Open on top, 2: fully enclosed (requires layer pause), 3: Open on bottom, 4: open top and bottom (magnetHoleDepth is ignored)]
// Radius of magnet
magnetRadius = 1.5;
// Amount that the magnet will stick out the side (negative to enclose magnet)
magnetOutset = .1;
// Chamfers for the top and/or bottom of the magnet hole. Chamfering the bottom of a blind hole helps with a press fit.
magnetTopChamferRadius = 1.8;
magnetBottomChamferRadius = 2;
// Depth of the magnet hole
magnetHoleDepth = 2.4;

/* [Assembly] */
assemblyStyle = 1;  // [0: Full part as-is, 1: Cut into 6 corner pieces, 2: Cut into 6 edge pieces]
// Adds tolerance for the clip-together joints. Only relevant if cut to one side
jointTolerance = 0.06;

// Utility Calculations
hTot = baseHeight + recessDepth;
rTot = innerRadius + outerOffset;

// modules
module assemblyTab(d, tolerance = 0, orientation = "h") {

  r_t = orientation == "v" ? apothemDiff / 3 : hTot / 3;
  r_t1 = r_t + tolerance;
  r_t2 = r_t / 1.5 + tolerance;

  h_t = orientation == "v" ? hTot : apothemDiff / 2;

  a_orient = orientation == "v" ? 0 : 90;
  z_orient = orientation == "v" ? 0 : hTot / 2;
  y_orient = orientation == "v" ? 0 : apothemDiff / 4;

  translate([-r_t1 - tolerance, d + y_orient, z_orient]) rotate([a_orient, 0, 0]) {
    cylinder(r1 = r_t2, r2 = r_t1, h = h_t / 2);
    translate([0, 0, h_t / 2]) cylinder(r1 = r_t1, r2 = r_t2, h = h_t / 2);
    translate([0, -r_t2, 0]) cube([r_t1, r_t2 * 2, h_t]);
  }
}

module hexHolder() {
  difference() {
    union() {
      difference() {
        linear_extrude(baseHeight + recessDepth) hexagon(r = innerRadius + outerOffset);
        translate([0, 0, baseHeight]) linear_extrude(baseHeight + recessDepth + 2) hexagon(r = innerRadius);
        if (tabType == 1) translate([0, 0, -1]) linear_extrude(baseHeight + recessDepth + 2) hexagon(r = innerRadius);
        if (tabType == 2) translate([0, 0, -1]) linear_extrude(baseHeight + recessDepth + 2) hexagon(r = innerRadius - tabWidth);
        for (t=[0:60:300]) {
          rotate([0, 0, t]) translate([innerRadius, 0, baseHeight]) cylinder(r = reliefRadius, h = recessDepth + .01);
        }
      }
      if (tabType == 1) {
        for (t=[0:60:300]) {
          for (c=[1:1:hexagonsPerSide]) {
            rotate([0, 0, t]) translate([(-innerRadius / 2) + c * (innerRadius / (hexagonsPerSide + 1)), tileApothem, 0]) linear_extrude(baseHeight) hexagon(tabWidth);
          }
        }
      }
    }

    translate([0, 0, -1]) difference() {
        linear_extrude(11) hexagon(r = 250);
        translate([0, 0, -1]) linear_extrude(12) hexagon(r = innerRadius + outerOffset);
    }

    if (magnetHoleStyle != 0) for (t=[0:60:300]) rotate([0, 0, t]) translate([0, outerApothemOffset - magnetRadius + magnetOutset, magnetHoleStyle == 3 ? -.001 : baseHeight + recessDepth - magnetHoleDepth])  {
      hMagHole = (magnetHoleStyle == 4) ? hTot : magnetHoleDepth;

      translate([innerRadius / 4, 0, 0]) cylinder(r = magnetRadius, h = hMagHole);
      translate([-innerRadius / 4, 0, 0]) cylinder(r = magnetRadius, h = hMagHole);

      translate([innerRadius / 4, 0, hMagHole - magnetTopChamferRadius]) cylinder(r1 = 0, r2 = magnetTopChamferRadius, h = magnetTopChamferRadius);
      translate([-innerRadius / 4, 0, hMagHole - magnetTopChamferRadius]) cylinder(r1 = 0, r2 = magnetTopChamferRadius, h = magnetTopChamferRadius);

      translate([innerRadius / 4, 0, 0]) cylinder(r2 = 0, r1 = magnetBottomChamferRadius, h = magnetBottomChamferRadius);
      translate([-innerRadius / 4, 0, 0]) cylinder(r2 = 0, r1 = magnetBottomChamferRadius, h = magnetBottomChamferRadius);
    }

    if (assemblyStyle == 1 || assemblyStyle == 2) {
      sliceAngle = assemblyStyle == 1 ? -30 : 0;
      d_tab = assemblyStyle == 1 ? (outerApothemOffset - apothemDiff / 2) : (innerRadius + outerOffset / 2);
      o_tab = assemblyStyle == 1 ? "v" : "h";

      difference() {
        translate([0, 0, -.001]) union() {
          rotate([0, 0, sliceAngle]) rotate_extrude(angle=300) square([rTot * 1.5, baseHeight + recessDepth + .002]);
          translate([0, -rTot * 1.5, 0]) cube([jointTolerance, rTot * 1.5, baseHeight + recessDepth + .002]);
          rotate([0, 0, sliceAngle - 90]) cube([jointTolerance, rTot * 1.5, baseHeight + recessDepth]);
        }
        
      rotate([0, 0, sliceAngle + 30]) assemblyTab(-d_tab, -jointTolerance, o_tab);
      }
      rotate([0, 0, sliceAngle + 90]) assemblyTab(-d_tab, 0, o_tab);
    }
  }
}

hexHolder();
