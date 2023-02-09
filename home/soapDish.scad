// Soap dish https://www.thingiverse.com/thing:4319245
// By David Phillip Oster. Creative Commons License.
// Version 1.0 4/27/2020
// TODO: the chamfer on the ridge faces that touch the soap are too subtle.
// The base is probably thicker than it needs to be.

// The diameter of the circle at the base.
bigDia = 65;

// Total length of the dish at the base.
bigLength = 120;

// The diameter of the circle measured at the top of base.
topDia = 58;

// The height of the base.
baseHeight = 18;

module crosSectionBase(){
  polygon([[0, 0],[32.5, 0],[29, 21],[27.5, 23],[24, 22],[20, 17],[11.85, 13],[6.6, 10],[0, 9]]);
}

module quarterBase(){
  translate([0, (bigLength-bigDia)/2, 0]){
    rotate_extrude(angle=90, convexity=2){
      crosSectionBase();
    }
  }
  translate([0, (bigLength-bigDia)/2, 0]) {
    rotate([90, 0, 0]){
      linear_extrude(height=(bigLength-bigDia)/2){
        crosSectionBase();
      }
    }
  }
}

module halfBase(){
  quarterBase();
  mirror([0,1,0])quarterBase();
}

module fullBase(){
  halfBase();
  mirror([1,0,0])halfBase();
}

// Cross section of the projection that holds the soap.
module ridge(){
  translate([-2.5, 7]){
    polygon([ [0,0], [30, 0], [30, 40.6], [28, 42], [26, 42],  [9.5, 10.5] ]);
  }
}

// extrude above Z, with a translated up smaller one as a chamfer.
module sixteenthRidge(){
  translate([0, 0, 2]){
    linear_extrude(height=2, scale=0.9, convexity=3){
      ridge();
    }
  }
  linear_extrude(height=2, convexity=3) {
    ridge();
  }
}

// mirror in Z - one full ridge.
module eighthRidge(){
  sixteenthRidge();
  mirror([0,0,1]){sixteenthRidge(); }
}

// flip up into place.
module quarterRidge(){
  translate([0, bigLength/6, 0]){
    rotate([90, 0, 0]){
      eighthRidge();
    }
  }
}

// Now there are two of them.
module halfRidge(){
  quarterRidge();
  mirror([1, 0, 0]){quarterRidge();}
}

// All four.
module fullRidge(){
  halfRidge();
  mirror([0, 1, 0]){halfRidge();
  }
}

module soapDish(){
  fullBase();
  fullRidge();
}

soapDish();
