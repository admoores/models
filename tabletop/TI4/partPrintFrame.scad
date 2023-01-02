include <./magnetHexHolder.scad>

nx = 2;
ny = 6;

dx = 65;
dy = 13;

dx1 = 1;
dy1 = 200;

ox = .5;
oy = 0;

h0 = 2;
h1 = baseHeight;
h2 = baseHeight;

w0 = 2.6;
w1 = 1.3;
w2 = 1.3;

extraYEmpty = 1.5;
extraXEmpty = 0;

y0 = dy * (ny + extraYEmpty);
x0 = dx * (nx + extraXEmpty);

frame = false;

module part() {
  translate([-(x0/2 - dx/2), innerRadius + outerOffset - (y0/2 - dy/2), 0]) rotate([0, 0, -30]) hexHolder(); 
}

module frame() {
  translate([0, 0, h0/2]) difference() {
    cube([x0, y0, h0], center=true);
    cube([x0 - w0 * 2, y0 - w0 * 2, h0 + 1], center=true);
  }

  translate([-x0/2, 0, h1/2]) for (divX=[dx * ox:dx*dx1:x0]) {
    translate([divX, 0, 0]) cube([w1, y0, h1], center=true);
  }
  translate([0, -y0/2, h2/2]) for (divY=[dy * oy:dy*dy1:y0]) {
    translate([0, divY, 0]) cube([x0, w2, h2], center=true);
  }
}

!union() {
  for(partX=[0:dx:x0 - (dx * (1 + extraXEmpty))]) {
    for (partY=[0:dy:y0 - (dy * (1 + extraYEmpty))]) {
      translate([partX, partY, 0]) part();
    }
  }
  if (frame) {
    frame();
  }
}