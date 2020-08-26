$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

difference() {
  union() {
    import("PoopBagHolderBody_v2.stl");
    translate([4.5, 5.5, 26]) cube([11, 64.5, 2]);
    translate([-15.5, 5.5, 26]) cube([11, 64.5, 2]);
    translate([4.5, 5.5, 21.5]) cube([8, 64.5, 3.5]);
    translate([-12.5, 5.5, 21.5]) cube([8, 64.5, 3.5]);
  }
  translate([4.5, 5.5, 21.5]) cube([6, 64.5, 3.5]);
  translate([-10.5, 5.5, 21.5]) cube([6, 64.5, 3.5]);
  translate([0, 5.5 + (64.5 / 2), 28]) cube([11, 64.5, 10], center=true);
}