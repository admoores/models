$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

length = 125;
width = 5;
thickness = 1.2;

nodeWidth = 2;

endLength = 7.5;
endWidth = width + nodeWidth * 2 + thickness * 2;

tipLength = 7.5;

tolerance = .25;

union() {
  cube([length, width, thickness]);
  translate([0, width / 2, 0]) cylinder(r = width / 2, h = thickness);

  for (x=[tipLength:nodeWidth:length]) {
    translate([x, width, 0]) cylinder(r = nodeWidth / 2, h = thickness);
    translate([x, 0, 0]) cylinder(r = nodeWidth / 2, h = thickness);
  }

  difference() {
    union() {
      translate([length + width / 4, -nodeWidth - thickness, 0]) cube([endLength, endWidth, thickness]);
      translate([length + width / 4, width / 2, 0]) cylinder(r = endWidth / 2, h = thickness);
      translate([length + width / 4 + endLength, width / 2, 0]) cylinder(r = endWidth / 2, h = thickness);
    }

    translate([length, -tolerance / 2, -.5]) cube([thickness + tolerance, width + tolerance, thickness + 1]);
    translate([length + (thickness + tolerance) * 2, -tolerance / 2, -.5]) cube([thickness + tolerance, width + tolerance, thickness + 1]);
    translate([length + width / 4 + endLength, width / 2, - .5]) cylinder(r = width / 2, h = thickness + 1);
  }
}