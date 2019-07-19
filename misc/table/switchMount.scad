$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

length = 33.5;
width = 19.5;
depth = 20;
holeDiam = 12;
wallThickness = 5;
screwHoleDiam = 4.25;
countersinkDiam = 8;

difference() {
  translate([-1 * wallThickness, 0, 0]) {
    cube([length + 2 * wallThickness, width + wallThickness, depth + wallThickness]);
  }
  cube([length, width, depth]);
  translate([length / 2, width / 2, 0]) {
    cylinder(r=holeDiam / 2, h=depth * 2);
  }
}

for(i=[0, 1]) {
  mirror([i, 0, 0]) {
    translate([-i * length, 0, 0]) {
      intersection() {
        translate([-wallThickness, wallThickness / 2, (depth + wallThickness) / 2]) {
          rotate([90, 0, 0]) {
            difference() {
              cylinder(r=(depth + wallThickness) / 2, h=wallThickness, center=true);
              translate([-wallThickness, 0, 0]) {
                cylinder(r=screwHoleDiam / 2, h = wallThickness, center=true);
                cylinder(r1=countersinkDiam / 2, r2=0, h= wallThickness, center=true);
              }
            }
          }
        }
        translate([(depth + wallThickness) / -2 - wallThickness, 0, 0]) {
          cube([(depth + wallThickness) / 2, wallThickness, depth + wallThickness]);
        }
      }
    }
  }
}