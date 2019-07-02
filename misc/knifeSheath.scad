  $fa=0.5; // default minimum facet angle is now 0.5
  $fs=0.5; // default minimum facet size is now 0.5 mm

  lengthFromOrigin = 95.7;
  fullLength = 125;
  fullThickness = 9;
  arcRadius = 260;
  thickestWidth = 36.5;

difference() {
  intersection() {
    translate([(arcRadius - thickestWidth / 2), 0, 0]) {
      cylinder(h=fullThickness, r=arcRadius, center=false);
    }
    translate([-1 * (arcRadius - thickestWidth / 2), 0, 0]) {
      cylinder(h=fullThickness, r=arcRadius, center=false);
    }
    translate([(-2 * fullThickness),(lengthFromOrigin * -1),0]) {
      cube([thickestWidth, fullLength, fullThickness]);
    }
  }
  translate([0, (lengthFromOrigin * -1) + 7, 0]) {
    difference() {
      translate([-2.5, -10, -1]) {
        cube([5, 10, fullThickness + 2]);
      }
      translate([0, 0, -2]) {
        cylinder(h=fullThickness + 4, r=2.5, center=false);
      }
    }
  }
}