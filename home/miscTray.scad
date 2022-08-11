$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

width = 100;
length = 200;
height = 5;

wallThickness = 2.4;

union() {
  difference() {
    hull() {
      translate([height / 4, height / 4, 0]) cube([width - height / 2, length - height / 2, 0.01]);
      translate([0, 0, height]) cube([width, length, 0.01]);
    }

    hull() {
      translate([height / 4 + wallThickness, height / 4 + wallThickness, wallThickness]) cube([width - height / 2 - (2 * wallThickness), length - height / 2 - (2 * wallThickness), 0.01]);
      translate([wallThickness, wallThickness, height + 0.01]) cube([width - (2 * wallThickness), length - (2 * wallThickness), 0.01]);
    }

    #translate([width / 2, length / 2, wallThickness / 2]) resize([width * .75, width * .75]) rotate([0, 0, 90]) translate([-50, -50]) linear_extrude(wallThickness / 2 + .01) import("../personal/LogoExtrude.dxf", layer="final");
  }

  fifthWidth = (width - height / 2) / 5;
  fifthLength = (length - height / 2) / 5;
  translate([height / 4, height / 4, 0]) {
    for(x = [0:fifthWidth:fifthWidth*4]) {
      for (y = [0:fifthLength:fifthLength*4]) {
        translate([x, y, 0]) hull(){
          cube([fifthWidth, fifthLength, 0.01]);
          translate([wallThickness, wallThickness, -wallThickness]) cube([(fifthWidth) - (wallThickness*2), (fifthLength) - (wallThickness*2), 0.01]);
        }
      }
    }
  }
}
