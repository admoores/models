module teardrop(radius) {
  coordinate = radius * sqrt(2) / 2;
  union() {
    circle(r = radius);
    polygon([[coordinate, coordinate], [-coordinate, coordinate], [0, 2 * coordinate]]);
  }
}