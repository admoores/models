$fa=4; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

divisionWidth = 10;

translate([(divisionWidth / -2), 0, 0]) cube([divisionWidth, 50, 2.5]);
rotate([0, 0, 120]) translate([(divisionWidth / -2), 0, 0]) cube([divisionWidth, 50, 2.5]);
rotate([0, 0, 240]) translate([(divisionWidth / -2), 0, 0]) cube([divisionWidth, 50, 2.5]);
cylinder(h=25, r=divisionWidth / 4);