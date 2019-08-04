$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.05; // default minimum facet size is now 0.05 mm

railWidth = 25;
holeDiam = 5;
capTopDepth = 5;
capProngDepth = 5;
tolerance = .2;
centerWidth = 8.76;
centerDepth = 5.84;
openingWidth = 6.50;


union() {
  cube([railWidth, railWidth, capTopDepth]);
  translate([railWidth / 2, railWidth / 2, capTopDepth]) {
    translate([0, 0, capProngDepth]) sphere(r = (holeDiam / 2) - tolerance);
    cylinder(r = (holeDiam / 2) - tolerance, h=capProngDepth);
  }

  translate([(railWidth / 2) - (openingWidth - tolerance * 2) / 2, 0, capTopDepth]) cube([openingWidth - tolerance * 2, centerDepth - tolerance, capProngDepth]);
  translate([(railWidth / 2) - (openingWidth - tolerance * 2) / 2, railWidth - centerDepth + tolerance, capTopDepth]) cube([openingWidth - tolerance * 2, centerDepth - tolerance, capProngDepth]);

  translate([0, (railWidth / 2) - (openingWidth - tolerance * 2) / 2, capTopDepth]) cube([centerDepth - tolerance, openingWidth - tolerance * 2, capProngDepth]);
  translate([railWidth - centerDepth + tolerance, (railWidth / 2) - (openingWidth - tolerance * 2) / 2, capTopDepth]) cube([centerDepth - tolerance, openingWidth - tolerance * 2, capProngDepth]);

}