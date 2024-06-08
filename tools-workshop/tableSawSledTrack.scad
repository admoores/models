include <../modules/chamferedScrew.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

screwHoleDiam = 4.75;
countersinkDiam = 9;
screwSpacing = 25;

len = 200;

w1 = 21;
w2 = 17;
h1 = 3.75;
h2 = 4;

tw = (w1 - w2) / 2;

difference() {
  union() {
    cube([len, w1, h1]);
    translate([0, tw, 0]) cube([len, w2, h1 + h2]);
  }

for (x=[screwSpacing/2:screwSpacing:len]) {
  translate([x, w1 / 2, -1]) cylinder(r = countersinkDiam / 2, h = h1 + 1);
  translate([x, w1 / 2, h1 + h2 + h1]) rotate([0, 180, 0]) chamferedScrewHole(countersinkDiam / 2, screwHoleDiam / 2, h1 + h2, screwHoleDiam / 3 * 2);
}

  // rotate([0, 180, 0]) translate([len / -2, w1 / 2 + countersinkDiam / 2 + 3, -1]) linear_extrude(2) text(str("H2: ", h2), size = 4, halign = "center", valign = "center", font="Liberation Sans:style=Bold");
  // rotate([0, 180, 0]) translate([len / -2, w1 / 2 - countersinkDiam / 2 - 3, -1]) linear_extrude(2) text(str("H2: ", h2), size = 4, halign = "center", valign = "center", font="Liberation Sans:style=Bold");
}