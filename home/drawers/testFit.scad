include <_common.scad>

// Outer Rim
// difference() {
//   resize([width, 10, height]) baseShape();
//   translate([wallThickness, 0, wallThickness]) resize([width - wallThickness * 2, 10, height - wallThickness * 2]) baseShape();
// }

// Inner Drawer
difference() {
    resize([width - wallThickness * 2 - tolerance * 2, 10, height - wallThickness * 2 - tolerance * 2]) baseShape();
}