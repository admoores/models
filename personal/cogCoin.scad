$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

coinThickness = 10;
coinRadius = 50;
cutoutRad = 5;

module profile() {
  circle(r=coinThickness / 2);
  translate([0, -(coinThickness / 2)]) square([coinRadius / 2, coinThickness]);
}


difference() {
  rotate_extrude() {
    translate([coinRadius / -2, 0, coinThickness / 2]) profile();
  }
  union() {
    numCutouts = 16;
    for (i = [0:numCutouts]) {
      rotate([0, 0, (360/numCutouts) * i]) translate([((coinRadius / 2) + coinThickness / 2) + cutoutRad / 2, 0, (coinThickness / -2) - 1]) cylinder(r = cutoutRad, h = coinThickness + 2);
    }

    scale([.5, .5, 1]) translate([-50, -50, (coinThickness / -2) - 1]) linear_extrude(coinThickness + 2) {
      import("LogoExtrude.dxf", layer="final");
    }
  }

}