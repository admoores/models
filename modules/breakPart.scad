
module rotFromTo(di,do)
    if( norm(di-do)==0 || norm(di)==0 || norm(do)==0 )
        children();
    else
        mirror(do/norm(do)+di/norm(di)) mirror(di) children(); 

module breakPart(normal = [0, 0, 0], shift=0, pinLocs = [[0, 0]], pinType = 0) {
  // First child is the part itself, second child is the pin
  //   - The pin should be centered in x and y and into the positive z direction
  // normal: Vector normal to the plane of breaking
  // shift: How far from the origin to move the center of the plane
  // pinOffset: Offset for pin (hole -> wider, pin -> narrower)
  // pinType: [0: attached (M), 1: F]
  _BIG = 250;

  difference() {
    children(0);
    rotFromTo([0, 0, 1], normal) translate([0, 0, shift]) {
      difference() {
        cylinder(r = _BIG/2, h = _BIG);
        if (pinType == 0) for (loc = pinLocs) {
          translate(concat(loc, [shift - eps])) {
            children(1);
          }
        }
      }
      if (pinType == 1) for (loc = pinLocs) {
        mirror([0, 0, 1]) translate(concat(loc, [shift - eps])) {
          children(1);
        }
      }
    } 
  }

}