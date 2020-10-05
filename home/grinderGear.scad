$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

washerRad = 6;
screwDepth = 7;

difference() {
  union() {
    import("meatgear_weston_auger.stl");
    translate([0, 0, 11.99]) difference() {
      cylinder(r = 9, h = 11.8);
      translate([0, 0, -.05]) cylinder(r = 6.5, h = 12.1);
    }
    difference() {
      cylinder(r = 18.1, h = 4);
      translate([0, 0, -.05]) cylinder(r = 10, h = 4.1);
    }
  }

  translate([0, 0, 4.01]) difference() {
    cylinder(r = 15, h = 4);
    translate([0, 0, -.05]) cylinder(r = 12, h = 4.1); 
  }

  translate([10, -4, -.01]) cube([10, 8, 1.5]);
  translate([-20, -4, -.01]) cube([10, 8, 1.5]);

  #cube([10.1, 10.1, 24], center=true);
}
