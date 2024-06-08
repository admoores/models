$fa=4; // default minimum facet angle is now 4
$fs=0.05; // default minimum facet size is now 0.05 mm

blockSupport = true;
innerCutout = true;
outerCutout = true;

label = false;
labelText = "00";

magnet = true;
ml = 10.1;
mw = 5.1;
md = 2.5;

x0 = 16.5;
x1 = 15.5;
y0 = 14.8;
y1 = 13.6;
z0 = 30.0;
z1 = 16.0;

t0 = 2.75;
t1 = .25; // Integrated Support Separation

a0 = 5.5;
a1 = 3.5;

h = y1 - a1;
c = z0 - 2*a0;
r0 = y1 / 2 + pow(c, 2) / (8 * h);

module finger(o = 0) {
  hull() {
    resize([x0 + o, y0 + o, 0.01]) cylinder(r = 10, h = 1);
    translate([0, 0, z0]) resize([x1 + o, y1 + o, 0.01]) cylinder(r = 10, h = 1);
  }
}

difference() {
  // Base Shape: 2D Tapered Tube
  finger(o = t0 * 2);
  finger();

  // Just to clean up preview top/bottom openings
  translate([0, 0, -1]) resize([x0, y0, 1.001]) cylinder(r = 1, h = 1);
  translate([0, 0, z0]) resize([x1, y1, 1]) cylinder(r = 1, h = 1);

  // Inside of finger cutout (with integrated support)
  if (innerCutout) {
    difference() {
      translate([0,-r0 + y1 / 2 - a1, z0 / 2 - t1 / 2]) rotate([0, 90, 0]) cylinder(r = r0, h = x0 * 2, center = true);
      translate([0,-r0 + y1 / 2 - a1, (z0 - t1) / 2]) rotate([0, 90, 0]) cylinder(r = r0 - t1, h = x0 * 2, center = true);
    }
    translate([0, 0, z0 / 2]) rotate([90, 0, 0]) cylinder(r = c / 4, h = y0);
  }

  // Outside of finger cutout (with integrated support)
  if (outerCutout) {
    difference() {
      union() {
        translate([0,-(r0 + a0) + y1 / 2 + t1, z0 / 2]) rotate([0, 90, 0]) cylinder(r = (r0 + a0), h = x0 * 2, center = true);
        translate([-25, -y0 / 2, (z0/2 - z1/2) - t1]) cube([50, 50, z0 + t1 * 2]);
      }
      translate([0,-(r0 + a0 - t1) + y1 / 2, z0 / 2]) rotate([0, 90, 0]) cylinder(r = (r0 + a0) - t1, h = x0 * 2, center = true);
      translate([-25, 0, (z0/2 - z1/2)]) cube([50, 50, z1]);
    }
  }

  // Marks the outside with a label (for later tweaking)
  if (label) {
    translate([0, (y1 + y0) / 4 + t0 * .5, z0 / 2]) rotate([90, 0, 180]) linear_extrude(t0) {
      text(size = 4, labelText, halign="center", valign="center", font="Liberation Sans:style=Bold");
    }
  } else if (magnet) {
    translate([-(mw/2), y1/2 - .1, z0 / 2 - ml/2]) cube([mw, md, ml]);
  }
}

// Disc on build plate (should snap off)
if (blockSupport) {
  difference() {
    translate([0, 0, -1 - t1]) cylinder(r = x0 / 2 + (t0 * 2), h = 1);
    translate([0, 0, -1.1 - t1]) cylinder(r = y0 / 2 - t0, h = 1.2);
  }
}