$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

rodRad = 2.5;
tolerance = .2;

difference() {
  translate([0, 0, (rodRad * 2) / 2]) sphere(r = (rodRad * 2));
  translate([-rodRad * 2, -rodRad * 2, -rodRad]) cube([rodRad * 4, rodRad * 4, rodRad]);
  translate([0, 0, -.1])cylinder(r = rodRad + tolerance / 2, h = rodRad * 2 + .1);
}