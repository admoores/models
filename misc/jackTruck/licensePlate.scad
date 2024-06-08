include <_common.scad>

thickness = 5;
width = 6;
length = 35;

textDepth = .65;
textSize = 3.25;
textBorder = 1.50;

text = "JACK-001";

difference() {
  cube([length, width, thickness]);
  translate([length / 2, width / 2, thickness - textDepth + 0.001]) linear_extrude(textDepth) resize([length - textBorder * 2, width - textBorder * 2]) text(text, halign = "center", valign = "center", size = textSize, font="Bitstream Vera Sans Mono:style=Bold", spacing = .85);
}