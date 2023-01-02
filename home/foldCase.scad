$fa=4 + 0; // default minimum facet angle is now 0.5
$fs=0.05 + 0; // default minimum facet size is now 0.05 mm
eps = .001 + 0;

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
cfl = 2;
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
mcz = mcl * _l;
mz = (ml + mcl) * _l;

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

if (cz1 < mz || cz2 < mz) {
  text("NO ROOM FOR MAGNETS", valign = "center", halign = "center");
} else {
  caseBase(cx, cy, cz1, cr) {
    cube([100, 100, 100], center=true);
  }
  translate([cx + cz1 + cz2 + cst + cr * 2, 0, 0]) caseBase(cx, cy, cz2, cr) {
    cube([100, 100, 100], center=true);
  }
  translate([-cx / 2, -cy / 2, -cfz]) linear_extrude(cfz) offset(r=cr + cfo) square([cx * 2 + cz1 + cz2 + cst + cr * 2, cy]);
}
