include <defs.scad>
include <lego_defs.scad>

PLATE_COUNT_HEIGHT = 3;
MIN_TOP = 1;
top = PLATE_HEIGHT * ceil((MAGNET_HEIGHT + MIN_TOP) / PLATE_HEIGHT);
difference() {
  translate([-STUD_DIST+GAP,-STUD_DIST+GAP,0]) {
    cube([2*STUD_DIST-2*GAP, 2*STUD_DIST-2*GAP,top]);
  }
  cylinder(d=MAGNET_DIAM, h= MAGNET_HEIGHT);
 

}
for (x=[-STUD_DIST/2:STUD_DIST:STUD_DIST]) {
  for (y=[-STUD_DIST/2:STUD_DIST:STUD_DIST]) {
    translate([x,y,top]) {
      cylinder(d=STUD_DIAM, h=STUD_HEIGHT);
    }
  }
 }


