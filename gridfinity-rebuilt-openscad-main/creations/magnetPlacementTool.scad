include <../gridfinity-rebuilt-baseplate.scad>

/* [Setup Parameters] */
$fa = 8;
$fs = 0.25;

/* [General Settings] */
// number of bases along x-axis
gridx = 1;  
// number of bases along y-axis   
gridy = 1;  
// base unit
length = 42;

/* [Fit to Drawer] */
// minimum length of baseplate along x (leave zero to ignore, will automatically fill area if gridx is zero)
distancex = 0; 
// minimum length of baseplate along y (leave zero to ignore, will automatically fill area if gridy is zero)
distancey = 0; 

/* [Styles] */

// baseplate styles
style_plate = 2; // [0: thin, 1:weighted, 2:skeletonized]

// enable magnet hole
enable_magnet = true; 

// hole styles
style_hole = 2; // [0:none, 1:contersink, 2:counterbore]

// screw hole radius
r_hole1 = 2;  
// magnet hole radius
r_hole2 = 4; 
// center-to-center distance between holes
d_hole = 26;    
// magnet hole depth
h_hole = 20;   
// slit depth (printer layer height)
h_slit = 0.4; 

bottomDepth = 23;

// Plug for repeling magnets
plugHeight = 7.5;
plugHoleDepth = 4.2;
plugHoleRadius = 2.7;


!union() {
  intersection() {
    gridfinityBaseplate(gridx, gridy, length, distancex, distancey, style_plate, enable_magnet, style_hole);
    for (t=[45:90:360]) {
      rotate([0, 0, t]) translate([d_hole / 2 + r_hole2 + d_wall, 0, -bottomDepth]) cylinder(r = r_hole2 + d_wall * 1.5, h = bottomDepth);
    }
  }
  rotate([0, 0, 45]) {
    translate([-d_hole / 2, -d_wall / 2, -bottomDepth]) cube([d_hole, d_wall, bottomDepth]);
    rotate([0, 0, 90]) translate([-d_hole / 2, -d_wall / 2, -bottomDepth]) cube([d_hole, d_wall, bottomDepth]);
  }

  translate([0, 0, -bottomDepth]) cylinder(r = 7.5, h = 70);
  translate([0, 0, 50]) sphere(r = 10);

    for (t=[0:90:270]) {
      rotate([0, 0, t]) translate([d_hole, 0, -bottomDepth]) difference() {
        union() {
          cylinder(r = r_hole2, h = plugHeight);
          translate([0, 0, plugHeight]) cylinder(r1 = r_hole2, r2 = plugHoleRadius, h = r_hole2 - plugHoleRadius);
        }
        translate([0, 0, plugHeight - plugHoleDepth]) cylinder(r = plugHoleRadius, h = plugHoleDepth + (r_hole2 - plugHoleRadius));
        translate([0, 0, plugHeight]) cylinder(r2 = r_hole2, r1 = plugHoleRadius, h = r_hole2 - plugHoleRadius);
      }
    }

}