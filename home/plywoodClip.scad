$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

gapWidth = 4.75;
gapDepth = 15;
tabLen = 25;
wallThickness = 2.6;

// Quad Corner

// translate([-gapWidth / 2 - wallThickness, -gapWidth / 2 - wallThickness, 0]) cube([gapWidth + wallThickness * 2, gapWidth + wallThickness * 2, gapDepth + wallThickness]);
// difference() {
//   cylinder(r = tabLen, h = wallThickness);
//   cylinder(r = tabLen / 2 , h = wallThickness);
// }
// intersection() {
//   for (i=[0:90:270]) {
//     rotate([0, 0, i]) translate([gapWidth / 2, -wallThickness - gapWidth / 2, 0]) {
//       difference() {
//         cube([tabLen, wallThickness * 2 + gapWidth, gapDepth + wallThickness]);
//         translate([0, wallThickness, wallThickness]) cube([tabLen, gapWidth, gapDepth]);
//       }
//     }
//   }
//   sphere(r = tabLen);
// }

// Edge 90


translate([0, gapWidth / -2 - wallThickness, gapWidth / -2 - wallThickness]) cube([tabLen, gapWidth + wallThickness * 2, gapWidth + wallThickness * 2]);
for (i=[0:90:90]) {
  rotate([i, 0, 0]) translate([0, gapWidth / -2 - wallThickness, gapWidth / 2]) {
    difference() {
      cube([tabLen, wallThickness * 2 + gapWidth, gapDepth + wallThickness]);
      translate([0, wallThickness, wallThickness]) cube([tabLen, gapWidth, gapDepth]);
    }
  }
}