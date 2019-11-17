$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

rodRadius = 2.5;
dividerHeight = 150;
dividerBodyWidth = 2.4;
dividerWidth =

union() {

}

module teardrop(radius) {
  coordinate = radius * sqrt(2) / 2;
  union() {
    circle(r = radius);
    polygon([[coordinate, coordinate], [-coordinate, coordinate], [0, 2 * coordinate]]);
  }
}