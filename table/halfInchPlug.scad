$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

plugWidth = 12.7;
plugDepth = 12.7;
screwDiam = 5;
shoulderDiam = 8.5;
shoulderDepth = 7;
tolerance = .2;
glueChannelWidth = 2;
glueChannelDepth = 1;
glueChannelHeight = 5;

function tol(value, m) = value - (m * tolerance);

difference() {
  union() {
    cylinder(r = tol(plugWidth / 2, 1), h=plugDepth);
  }

  union() {
    translate([0, 0, -.1]) cylinder(r = tol(screwDiam / 2, -1), h=plugDepth + .2);
    translate([0, 0, plugDepth - shoulderDepth]) cylinder(r = tol(shoulderDiam / 2, -1), h = shoulderDepth + .1);
    for(i = [0, 1]) {
      rotate([0, 0, 90 * i]) union() {
        translate([-glueChannelWidth / 2, tol(plugWidth / 2, 1) - glueChannelDepth, (plugDepth - glueChannelHeight) / 2]) cube([glueChannelWidth, 5, glueChannelHeight]);
        translate([-glueChannelWidth / 2, -(tol(plugWidth / 2, 1) - glueChannelDepth + 5), (plugDepth - glueChannelHeight) / 2]) cube([glueChannelWidth, 5, glueChannelHeight]);
      }
    }
  }
}