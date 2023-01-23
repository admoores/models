include <../../_constants.scad>
include <./_common.scad>

_l = .3 + 0;

footRad = 5;
rail2 = railDistance * 2 + railDiam * 3 + footRad;

baseHeight = 5;

width = 80;
height = 25;

filletRad = footRad;

/* [Magnet] */
// Magnet Hole Style
mSt = 1; // [0: None, 1: Exposed]
// Magnet Hole Radius
mr = 3.05;
// Magnet Hole Depth (in layers)
ml = 7;
// Minimum magnet bottom layers
mbl = 3 + 0;
mbz = mbl * _l;
// Chamfer around top of magnet holes (in layers)
mcl = 1;
mcz = mcl * _l;
mz = (ml + mcl) * _l;

module magnetHole(r = mr, h = mz, l = _l, c = mcz) {
  cylinder(r = r, h = h - c + eps);
  translate([0, 0, h - c]) cylinder(r2 = r-c, r1 = r, h = c);
}

module railCatcher() {
  cube([rail2, footRad * 2, baseHeight], center=true);
  translate([rail2/2, 0, -baseHeight / 2]) sphere(r = footRad);
  translate([-rail2/2, 0, -baseHeight / 2]) sphere(r = footRad);
  translate([rail2/2, 0, -baseHeight / 2]) cylinder(r = footRad, h = baseHeight);
  translate([-rail2/2, 0, -baseHeight / 2]) cylinder(r = footRad, h = baseHeight);
}

union() {
  translate([0, -width/2, 0]) railCatcher();
  cube([rail2, width, 5], center=true);
  translate([0, width/2, 0]) railCatcher();

  difference() {
    translate([0, 0, height/2 + baseHeight / 2]) minkowski() {
      cube([rail2 / 3 * 2, width, height], center=true);
      sphere(r = filletRad);
    }

    translate([0, 0, height * sqrt(2)]) rotate([0, 45, 0]) minkowski() {
      cube([height, width * 2, height], center=true);
      sphere(r = filletRad);
    } 

    translate([rail2/4, width/2 + footRad + eps - mz, 20]) rotate([-90, 0, 0]) magnetHole(c=0);
    translate([-rail2/4, width/2 + footRad + eps - mz, 20]) rotate([-90, 0, 0]) magnetHole(c=0);

    translate([rail2/4, -(width/2 + footRad + eps - mz), 20]) rotate([90, 0, 0]) magnetHole(c=0);
    translate([-rail2/4, -(width/2 + footRad + eps - mz), 20]) rotate([90, 0, 0]) magnetHole(c=0);
  }
}