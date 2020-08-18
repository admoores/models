module hexagon(r = 1) {
  polygon([
    [-1 * r, 0],
    [-.5 * r, r * sqrt(3) / 2],
    [.5 * r, r * sqrt(3) / 2],
    [1 * r, 0],
    [.5 * r, r * sqrt(3) / -2],
    [-.5 * r, r * sqrt(3) / -2],
  ]);
}