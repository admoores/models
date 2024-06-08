module flatScrewHole(rh, rs, d, ds, t = .1) {
  translate([0, 0, -t]) cylinder(h = d + t, r = rs);
  translate([0, 0, d - ds + t]) cylinder(h = ds + t, r = rh);
}