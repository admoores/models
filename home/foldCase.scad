$fa=4 + 0; // default minimum facet angle is now 0.5
$fs=0.05 + 0; // default minimum facet size is now 0.05 mm
eps = .005 + 0;

/* [Print Info] */
// Nozzle diameter
_n = 0.4;
// Line Thickness
_t = _n + .05;
// Layer Height
_l = 0.3;

/* [Case Dimensions] */
// Case outer width (x direction)
cox = 30;
// Case outer length (y direction)
coy = 100;
// Case height in layers (z direction) of first side
cl1 = 25;
cz1 = _l * cl1;
// Case height in layers (z direction) of second side
cl2 = 25;
cz2 = _l * cl2;
// Case corner radius
cr = 2.5;
// Spine excess width
cst = 1;
// Connection flap height in layers (0 for disconnected)
cfl = 3;
cfz = cfl * _l;
// Connection flap offset (0 for flush with case)
cfo = 1.2;
// Wall thickness
tw = .9;

cx = cox - cr * 2;
cy = coy - cr * 2;



/* [Magnet] */
// Magnet Hole Style
mSt = 1; // [0: None, 1: Exposed]
// Magnet Hole Radius
mr = 2.45;
// Magnet Hole Depth (in layers)
ml = 7;
// Minimum magnet bottom layers
mbl = 3 + 0;
mbz = mbl * _l;
// Chamfer around top/bottom of magnet holes (in layers)
mcl = 2;

/* [Design] */
// Design Style
ds = 1; // [0: None, 1: Full Inset panel]
// Panel Offset (for inset panel design)
dpo = 1.8;
// Export Panel Outline in 2d
ep2d = false;
// Export Panel
ep = true;
// DXF Import Path
dxfPath = "/home/gouda/Documents/Models/2D/foldCasePanelCharge.dxf";
// Total DXF Layer Count
dxfLayers = 2;
// Layer to Export (-1 for background)
dxfTargetLayer = 0;

mcz = mcl * _l;
mz = (ml + mcl) * _l;

totalX = (cx * 2 + cz1 + cz2 + cst + cr * 2);

module magnetHole(r = mr, h = mz, l = _l, c = mcz) {
  cylinder(r = r, h = h - c + eps);
  translate([0, 0, h - c]) cylinder(r2 = r-c, r1 = r, h = c);
}

module caseBase(x = cx, y = cy, z = cz1, r = cr, fz = cfz, fo = cfo, mhr = mr) {
  mhr2 = mhr * 1.75;

  difference() {
    linear_extrude(z) offset(r=cr) square([cx, cy], center = true);
    for (ix=[-1:2:1]) {
      for (iy=[-1:2:1]) {
        translate([ix * (x/2+cr) - ix * (mhr2), iy * (y/2+cr) - iy * (mhr2), 0]) {
          translate([0, 0, z - mz + eps]) magnetHole(mhr);
        }
      }
    }
    intersection() {
      difference() {
        translate([0, 0, tw]) linear_extrude(z - tw + eps) offset(r=cr - tw) square([cx - 2 * tw, cy - 2 * tw], center = true);
        for (ix=[-1:2:1]) {
          for (iy=[-1:2:1]) {
            translate([ix * (x/2+cr) - ix * (mhr2), iy * (y/2+cr) - iy * (mhr2), 0]) {
              union() {
                // This might suck. Here's a simple cylinder:
                // cylinder(r = mhr2, h = z);
                translate([0, 0, z - (mz + mbz)]) cylinder(r = mhr2, h = mz + mbz);
                hull() {
                  translate([0, 0, z - (mz + mbz)]) linear_extrude(eps) circle(r = mhr2);
                  translate([ix*mhr2/sqrt(2), iy*mhr2/sqrt(2), z - (mz + mbz + mhr2 * 2)]) linear_extrude(eps) circle(r = eps);
                }
              }
            }
          }
        }
      }

      children();
    }
  }
}

module firstLayerDesign(layer = dxfTargetLayer, layers = dxfLayers, path = dxfPath) {
  lTarget = str("L", layer);
  difference() {
    intersection() {
      linear_extrude(_l) offset(r=cr + cfo - dpo) square([totalX, cy]);
      if (layer != -1) translate([-(totalX) / 2 + dpo, -cy / 2 + dpo, 0]) linear_extrude(1) import(path, layer=lTarget);
    }
    for (l1 = [layer+1:1:layers]) {
      lTarget1 = str("L", l1);
      translate([-(totalX) / 2 + dpo, -cy / 2 + dpo, -eps]) linear_extrude(1 + eps * 2) import(path, layer=lTarget1);
    }
  }
}

module integratedSkirt() {
  skirtGap = 2;
  skirtThickness = 1;
  difference() {
        translate([-cx / 2, -cy / 2, -cfz]) linear_extrude(_l) offset(r=cr + cfo + skirtGap + skirtThickness) square([cx * 2 + cz1 + cz2 + cst + cr * 2, cy]);
        translate([-cx / 2, -cy / 2, -cfz - eps]) linear_extrude(_l + 2*eps) offset(r=cr + cfo + skirtGap) square([cx * 2 + cz1 + cz2 + cst + cr * 2, cy]);
  }
} 

if (cz1 < mz || cz2 < mz) {
  text("NO ROOM FOR MAGNETS", valign = "center", halign = "center");
} else if (ds == 1 && dpo <= 0) {
  text("PANEL OFFSET CANNOT BE 0", valign = "center", halign = "center");
} else {
  integratedSkirt();
  if (ep2d) {
    translate([-cx / 2, -cy / 2, -cfz]) offset(r=cr + cfo - dpo) square([cx * 2 + cz1 + cz2 + cst + cr * 2, cy]);
  } else if (ep) {
    translate([-cx / 2, -cy / 2, -cfz]) firstLayerDesign();
  } else {
    difference() {
      union() {
        caseBase(cx, cy, cz1, cr) {
          cube([100, 100, 100], center=true);
        }
        translate([cx + cz1 + cz2 + cst + cr * 2, 0, 0]) caseBase(cx, cy, cz2, cr) {
          cube([100, 100, 100], center=true);
        }
        translate([-cx / 2, -cy / 2, -cfz]) linear_extrude(cfz) offset(r=cr + cfo) square([cx * 2 + cz1 + cz2 + cst + cr * 2, cy]);
      }
      if (ds == 1) {
        translate([-cx / 2, -cy / 2, -cfz - eps]) linear_extrude(_l + eps) offset(r=cr + cfo - dpo) square([cx * 2 + cz1 + cz2 + cst + cr * 2, cy]);
      }
    }
  }

}
