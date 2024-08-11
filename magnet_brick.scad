include <defs.scad>
include <lego_defs.scad>

PLATE_COUNT_HEIGHT = 3;
top = PLATE_HEIGHT * PLATE_COUNT_HEIGHT;
difference() {
  translate([-STUD_DIST+GAP,-STUD_DIST+GAP,0]) {
    cube([2*STUD_DIST-2*GAP, 2*STUD_DIST-2*GAP,top]);
  }
  cylinder(d=MAGNET_DIAM, h= MAGNET_HEIGHT);
  translate([0,-STUD_DIST, top-HOLE_TOP_DIST]) {
    rotate([-90,0,0]) {
      cylinder(d= HOLE_DIAM, h= STUD_DIST*2);
      translate([0,0,0]) {
	cylinder(d= FLANGE_DIAM, h= FLANGE_DEPTH);
      }
      translate([0,0,STUD_DIST-FLANGE_DEPTH]) {
	cylinder(d= FLANGE_DIAM, h= 2* FLANGE_DEPTH);
      }
      translate([0,0,2*STUD_DIST-FLANGE_DEPTH]) {
	cylinder(d= FLANGE_DIAM, h= FLANGE_DEPTH);
      }
    }
  }

}
for (x=[-STUD_DIST/2:STUD_DIST:STUD_DIST]) {
  for (y=[-STUD_DIST/2:STUD_DIST:STUD_DIST]) {
    translate([x,y,top]) {
      cylinder(d=STUD_DIAM, h=STUD_HEIGHT);
    }
  }
 }


