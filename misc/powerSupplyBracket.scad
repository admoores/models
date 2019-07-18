$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

screwHoleWidth = 4.5;
screwHeadWidth = 8;
firstScrewHeight = 11;
secondScrewHeight = 36;
totalHeight = 45;
bracketWidth = 15;
bracketThickness = 5;
bracketTabLength = 15;
 // Wood Screw
screwHoleDiam = 4.75;
countersinkDiam = 9;

difference() {
  union() {
    cylinder(r = bracketWidth / 2, h = bracketThickness, center=false);
    translate([bracketWidth / -2, 0, 0]) {
      cube([bracketWidth, bracketTabLength - bracketWidth / 2, bracketThickness]);
    }
    translate([bracketWidth / -2, bracketTabLength - bracketWidth / 2, 0]) {
      cube([bracketWidth, bracketThickness, totalHeight - bracketWidth / 2]);
    }

    translate([0, bracketTabLength - bracketThickness, totalHeight - bracketWidth / 2]) rotate([90, 0, 0]) cylinder(r = bracketWidth / 2, h = bracketThickness, center=true);

    translate([0, bracketTabLength - bracketWidth / 2 - bracketThickness / 2, bracketThickness * 1.5]) {
      difference() {
        translate([bracketWidth / - 2, 0, bracketThickness / -2]) cube([bracketWidth, bracketThickness / 2, bracketThickness / 2]);
        rotate([0, 90, 0]) cylinder(r=2.5, h=bracketWidth + 2, center=true);
      }
    }
  }


  union() {
    cylinder(r=screwHoleDiam / 2, h = bracketThickness, center=false);
    cylinder(r2=countersinkDiam / 2, r1=0, h= bracketThickness + 1, center=false);

    for (i = [firstScrewHeight, secondScrewHeight]) {
      translate([0, (bracketTabLength - (bracketWidth / 2)) + bracketThickness + 1, i]) {
        rotate([90, 0, 0]) {
          cylinder(r = screwHoleWidth / 2, h = bracketThickness + 2, center=false);
          translate([0, 0, bracketThickness / 2 + 1]) {
            cylinder(r = screwHeadWidth / 2, h = bracketThickness / 2 + 1, center=false);
          }
        }
      }
    }
  }
}

