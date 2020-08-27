$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

include <../../modules/hexagon.scad>
include <../../modules/flatScrew.scad>

height = 25;
totalWidth = 350;
wallThickness = 6.4;
baseThickness = 3.2;

// M3 screw
screwRad = 1.6;
screwHeadRad = 3;
nutRad = 3.2;

//8020 Bolt
boltRad = 3.1;
boltHeadRad = 6;

// Corner
cornerBaseThickness = 2.4;
cornerRuneLen = 30;
bracketGap = 25;
runeLen = 150;
runeInternalOffset = .1;

// Side
sideWallThickness = wallThickness / 2;
diceLen = 150;
sideDiceLen = 15;
sideBaseThickness = cornerBaseThickness;