$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

smallRad = 9;
largeRad = 11;
smallL = 65.4;
largeL = 87.3;
tol = .3;

difference() {
  union() {
    cylinder(h = 50, r=largeRad - tol);
    translate([0, 0, 50]) sphere(r=largeRad - tol);
  }

  translate([0, 0, -.01]) union() {
    diff = largeL - smallL;
    cylinder(h = 50 - diff + tol, r = smallRad + tol);
    cylinder(h = largeL, r = 5); 
    translate([0, 0, 50 - diff + tol]) sphere(r = smallRad + tol);
  }
}

