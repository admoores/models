
difference() {
  cylinder(r = 50, h = 10);
  translate([-50, -50, -1]) linear_extrude(50) {
    import("LogoExtrude.dxf", layer="final");
  }
}