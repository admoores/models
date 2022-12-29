include <../gridfinity-rebuilt-utility.scad>

spoolRad = 13;
spoolLen = 26;

postRad = 2.25;
postHeight = 10;

postsX = 3;
postsY = 3;

bottomThickness = 2.4;

unitHeight = 6;

!union() {
  gridfinityInit(2, 2, height(unitHeight), bottomThickness, 42) {
    
  }

    translate([-30, -30, h_base + bottomThickness]) for (x=[0:1:postsX]) {
      for (y=[0:1:postsY]) {
        translate([x * spoolRad * 1.5, y * spoolRad * 1.5, 0]) {
          cylinder(r = postRad, h = postHeight - postRad);
          cylinder(r1 = postRad * 1.5, r2 = postRad, h = postRad);
          translate([0, 0, postHeight - postRad]) sphere(r = postRad);
        }
      }
    }

  gridfinityBase(2, 2, 42, 0, 0, 1);
}


