include <../../_constants.scad>

_l = .2;

/* [Magnet] */
// Magnet Hole Style
mSt = 1; // [0: None, 1: Exposed]
// Magnet Hole Radius
mr = 3.00;
// Magnet Hole Depth (in layers)
ml = 10;
// Minimum magnet bottom layers
mbl = 3 + 0;
mbz = mbl * _l;
// Chamfer around top of magnet holes (in layers)
mcl = 2;

mcz = mcl * _l;
mz = (ml + mcl) * _l;

w = 15;
l = 100;
h = 4;

module magnetHole(r = mr, h = mz, l = _l, c = mcz) {
  translate([0, 0, c - eps]) cylinder(r = r, h = h - 2*c + 2*eps);
  cylinder(r1 = r+c, r2 = r, h = c);
  translate([0, 0, h - c]) cylinder(r2 = r+c, r1 = r, h = c);
}

for (y = [10:(l-20)/4:l-10]) {
  translate([0, y, 0]) difference() {
    hull() {
      cylinder(r = 5, h = 5);
      #translate([0, 0, 50]) resize([10, 7.5, eps]) cylinder(r = 5, h = eps);
      translate([0, 0, 75]) resize([5, 2.5, eps]) cylinder(r = 5, h = eps);
    }
    translate([0, 0, 75]) resize([4, 2, 1]) sphere(r=5);
    translate([0, 0, -eps]) magnetHole();
  }
}

translate([10, 0, 0]) difference() {
  union() {
    hull() {
      translate([w/2, w/4, 0]) cylinder(r=w/2, h=h);
      translate([w/2, -w/4 + l, 0]) cylinder(r=w/2, h=h);
    }
    translate([w/2, l + 5, h]) rotate([0, 90, 0]) cylinder(r = w/2, h = w/4, center=true);
    translate([w/2, 0 - 5, h]) rotate([0, 90, 0]) cylinder(r = w/2, h = w/4, center=true);
  }
  translate([0, 0, -10]) cube([1000, 1000, 20], center=true);
  for (y = [10:(l-20)/4:l-10]) {
    translate([w/2, y, h - mz + eps]) magnetHole();
  }
}

sudo xz --decompress --stdout 20230118-0443-postmarketOS-v22.06-phosh-18-pine64-pinephone-installer.img.xz | sudo dd of=/dev/sdc bs=4M status=progress