include <modules/breakPart.scad>;
include <modules/hexagon.scad>;

$fa=1 + 0; // default minimum facet angle is now 0.5
$fs=0.01 + 0; // default minimum facet size is now 0.05 mm
eps = .005 + 0;
tol = .1;

defaultFont = "Bitstream Vera Sans Mono:style=Bold";
