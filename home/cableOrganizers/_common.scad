include <../../modules/chamferedScrew.scad>
include <../../modules/dovetail.scad>
include <../../modules/fillet.scad>


$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

length = 75;

anchorWidth = 15;

wallThickness = 2.4;

loopInnerDepth = 25;
loopDepth = loopInnerDepth + wallThickness * 2;
loopWidth = anchorWidth * 3/4;
loopLength = length - anchorWidth * 2;

screwHoleDiam = 4.75;
countersinkDiam = 9;

tolerance = .1;