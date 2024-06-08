include <../../_constants.scad>

rad = 15.5;

bulgeRad = 35;
height = 5;

underLogo = 2.5;

magRad = 2.9;
magDepth = 2.1;

difference () {
  intersection () {
    cylinder(r = rad, h = height);
    translate([0, 0, -bulgeRad + height]) sphere(r=bulgeRad);
  }
  resize([rad*1.5, rad*1.5, 50]) translate([-50, -50, underLogo]) linear_extrude(50) import("LogoExtrude.dxf", layer="final");
  cylinder(r = magRad, h = magDepth);
}