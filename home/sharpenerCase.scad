include <../_constants.scad>

l = 12.5;
w = 4.5;
h = 16.5;

extra = 2;

tw = 1.2;

difference() {
  cube([l + tw*2, w + tw*2 + extra, h], center=true);
  translate([0, 0, -tw/2 - eps]) cube([l, w, h + eps], center = true);
  translate([0, 0, 0]) cube([l, w + extra, h - extra*2 - tw], center = true);
  translate([0, 0, h/2]) cube([l / 2, w, tw + eps*2], center=true);
}