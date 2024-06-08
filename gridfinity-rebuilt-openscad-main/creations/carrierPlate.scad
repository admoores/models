include <../gridfinity-rebuilt-bins.scad>
include <../gridfinity-rebuilt-baseplate.scad>

eps = .001;

gridx = 3;
gridy = 4;

angleHeight = 17 * sqrt(2);

gx = gridx == 0 ? floor(distancex/length) : gridx; 
gy = gridy == 0 ? floor(distancey/length) : gridy; 
dx = max(gx*length-0.5, distancex);
dy = max(gy*length-0.5, distancey);

!union() {
  difference() {
    union() {
      gridfinityBaseplate(gridx, gridy, length, distancex, distancey, style_plate, enable_magnet, style_hole);
      translate([0, 0, -12.5]) gridfinityBase(gridx, gridy, length, div_base_x, div_base_y, 1, off=0);
      translate([(-length * gridx) / 2, (-length * gridy) / 2, -7.75]) {
        for (x=[length/2:length:gridx*length]) {
          for (y=[length/2:length:gridy*length]) {
            translate([x, y, 0]) {
              rounded_rectangle(length, length, 4.5, r_base);
            }
          }
        }
      }
    }

        translate([(-length * gridx) / 2, (-length * gridy) / 2, -12]) {
        for (x=[length/2:length:gridx*length]) {
          for (y=[length/2:length:gridy*length]) {
            translate([x, y, eps]) {
              cylinder(r1 = 10, r2 = 13, h = 9, center=false);
            }
          }
        }
      }

    translate([gridx * length / 2, 0, -15]) rotate([0, 45, 0]) cube([angleHeight, length * gridy, angleHeight], center=true);
    translate([-gridx * length / 2, 0, -15]) rotate([0, 45, 0]) cube([angleHeight, length * gridy, angleHeight], center=true);
    translate([0, gridy * length / 2, -15]) rotate([45, 0, 0]) cube([length * gridx, angleHeight, angleHeight], center=true);
    translate([0, -gridy * length / 2, -15]) rotate([45, 0, 0]) cube([length * gridx, angleHeight, angleHeight], center=true);
  }
}