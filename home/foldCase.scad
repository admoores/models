$fa=4 + 0; // default minimum facet angle is now 0.5
$fs=0.05 + 0; // default minimum facet size is now 0.05 mm
eps = .001 + 0;

/* [Print Info] */
nozzle = 0.4;
lineThickness = nozzle + .05;
layer = 0.3;
looseTol = .1;

/* [Primary Dimensions] */
// Width of the case (x direction)
caseX = 75;
// Length of the case (y direction)
caseY = 150;
// Depth of the case (in layers)
caseLayers = 50;
caseZ = caseLayers * layer;
// Radius of case fillet
caseFil = 5;


/* [Cover Flap] */
// Enable or disable cover flap
flap = true;
// Thickness of the flap (in layers)
flapLayers = 3;
flapZ = flapLayers * layer;
// Extra border around main case from flap
flapBorder = 1;
// Excess height on spine for folding action
flapSpineTol = 1;
// Radius of flap fillet
flapFil = caseFil + flapBorder;

flapX = caseX * 2 + caseZ + flapSpineTol + flapBorder * 2;
flapY = caseY + flapBorder * 2;

/* [Magnet] */
// Magnet Hole Style
magStyle = 1; // [0: None, 1: Exposed, 2: Enclosed (requires print pause)]
// Magnet Hole Radius <<TODO: Test multiple sizes>>
magRad = 2.45; // TODO: Run A Few Tests
// Magnet Hole Depth (in layers)
magLayers = 7;
// 
// Layers printed over magnet (for pause-insertion)   -> Cleaner results when flap layers is the same value
magCapLayers = 2;

// Number of magnets (evenly spaced)
magCt = 2;
// Chamfer around top/bottom of magnet holes (in layers)
magChmfrLayers = 2;
magChmfr = magChmfrLayers * layer;
magZ = (magLayers + magChmfrLayers * 2) * layer;
magCapZ = magCapLayers * layer;
magBodyZ = magStyle == 2 ? magZ + magCapZ : magZ;

module magnetHole(r = magRad, h = magZ, l = layer, c = magChmfr) {
   union() {
          translate([0, 0, -c]) cylinder(r = r, h = h - c * 2, center = true);
          translate([0, 0, h / 2 - c]) cylinder(r1 = r-c, r2 = r, h = c);
          translate([0, 0, h / 2 - 2 * c]) cylinder(r2 = r-c, r1 = r, h = c);
        }
}

module caseBase() {
  difference() {
    union() {
      translate([0, 0, -caseZ]) linear_extrude(caseZ) offset(r = caseFil) square([caseX - caseFil * 2, caseY - caseFil * 2], center=true);
      if (flap) {
        translate([flapX / 2 - caseX / 2 - flapBorder, 0, -caseZ - flapZ]) linear_extrude(flapZ) offset(r = flapFil) square([flapX - flapFil * 2, flapY - flapFil * 2], center=true);
        if (magStyle == 1 || magStyle == 2) difference() {
          translate([flapX / 2 - caseX / 2 - flapBorder * 2, 0, -caseZ - flapZ]) linear_extrude(flapZ + magBodyZ) offset(r = caseFil) square([flapX - caseFil * 2, caseY - caseFil * 2], center=true);
          translate([flapX / 2 - caseX / 2 - flapBorder * 2 - (magRad * 2) * 2 - eps, 0, -caseZ - flapZ - eps]) linear_extrude(caseZ + flapZ) square([flapX + eps*2, flapY+eps*2], center=true);
        }
      }
    
    }
    if (flap && magStyle != 0) {
      translate([-caseX / 2 + magRad * 2 + looseTol - eps, 0, -magBodyZ / 2 + eps]) cube([magRad * 4 + looseTol * 2 + eps * 2, caseY + eps * 2, magBodyZ + eps * 2], center = true);
      dropHoles = (magStyle == 2 ? magCapZ : 0) * 2;
      for (y=[0:(caseY - magRad * 4) / (magCt - 1):caseY - magRad * 2]) {
        translate([0, 0, magStyle == 1 ? eps : 0]) {
          translate([-caseX / 2 + magRad * 2, y - caseY / 2 + magRad * 2, -magZ * 1.5 - dropHoles]) magnetHole();
          translate([caseX * 1.5 + caseZ + flapSpineTol - magRad * 2, y - caseY / 2 + magRad * 2, -caseZ + magZ / 2]) magnetHole();
        }
        // translate([0, 0, magStyle == 2 ? magCapZ : -eps]) translate([-caseX / 2 + magRad * 2, y - caseY / 2 + magRad * 2, magZ / 2 - caseZ - flapZ]) magnetHole();
      }
    }
  }
}

module emptyCase() {
  wallThickness = 2;
  baseThickness = flapZ;
  shift = magRad + wallThickness;
  translate([shift, 0, -caseZ + baseThickness]) linear_extrude(caseZ) offset(r = caseFil) square([caseX - caseFil * 2 - (shift * 2) - wallThickness * 2, caseY - caseFil * 2 - wallThickness * 2], center=true);
};

difference() {
  caseBase();
  intersection() {
    emptyCase();
    // Create geometries here to create space in the case
  
  }
}

// MAGNET TEST
!difference() {
  iterations = 5;
  translate([-10, 0, 0]) cube([iterations * (magRad * 3 + 1) + magRad + 10, 30, magBodyZ + flapZ]);
  translate([-4, 5, flapZ + magBodyZ - magZ + eps]) rotate([0, 0, 0]) linear_extrude(magZ) text("7L", valign="center", halign="center", size=4, font="Bitstream Vera Sans Mono:style=Bold");
  translate([-4, 12.5, flapZ + magBodyZ - magZ + eps]) rotate([0, 0, 0]) linear_extrude(magZ) text("8L", valign="center", halign="center", size=4, font="Bitstream Vera Sans Mono:style=Bold");
  translate([-20, 17.5, -10]) cube([20, 20, 20]);

  for (i=[0:1:iterations-1]) {
    range = .3;
    r001 = (magRad - range) + ((range * 2) / iterations) * i;
    x001 = magRad * 2 + i * (magRad * 3 + 1);
    translate([x001, 5, flapZ + magBodyZ - magZ / 2 + eps]) magnetHole(r001, magZ);
    translate([x001, 12.5, flapZ + magBodyZ - magZ / 2 - layer / 2 + eps]) magnetHole(r001, magZ + layer);
    translate([x001, 22.5, flapZ + magBodyZ - magZ + eps]) rotate([0, 0, 90]) linear_extrude(magZ) text(str(r001), valign="center", halign="center", size=4, font="Bitstream Vera Sans Mono:style=Bold");
  }
}