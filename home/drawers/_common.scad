include <../../modules/fillet.scad>
include <../../modules/hexagon.scad>

$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

unit = 50;

unitsWide = 2;
unitsTall = 1;

width = unitsWide * unit;
height = unitsTall * unit;
depth = 150;

wallThickness = 2.8;
sphereDetentRad = 2.4;

filletRad = 4;

tolerance = 0.5;

// M3 screw
screwRad = 1.6;
screwHeadRad = 3;
nutRad = 3.2;


module baseShape() {
  difference() {
    cube([width, depth, height]);
    translate([filletRad, 0, filletRad]) rotate([90, 90, 180]) fillet(r = filletRad, l = depth);
    translate([width - filletRad, 0, filletRad]) rotate([90, 180, 180]) fillet(r = filletRad, l = depth);
    translate([filletRad, 0, height - filletRad]) rotate([90, 0, 180]) fillet(r = filletRad, l = depth);
    translate([width - filletRad, 0, height - filletRad]) rotate([90, -90, 180]) fillet(r = filletRad, l = depth);
  }
}