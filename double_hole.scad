include <defs.scad>
include <lego_defs.scad>
use <magnet_shell.scad>

OUTER_DIAM = 7.5;

magnet_shell();

difference() {
  union() {
    for (y=[-STUD_DIST/2, STUD_DIST/2]) {
      translate([-STUD_DIST/2+GAP,y,STUD_DIST*1.5]) {
	rotate([0,90,0]) {
	  cylinder(d=OUTER_DIAM, h=STUD_DIST-2*GAP);
	}
      }
    }
    translate([-STUD_DIST/2+GAP,-4.5,MAGNET_HEIGHT]) {
      cube([STUD_DIST-2*GAP, 9,STUD_DIST*1.8-MAGNET_HEIGHT]);
    }
  }
  for (y=[-STUD_DIST/2, STUD_DIST/2]) {
    translate([-STUD_DIST/2,y, STUD_DIST*1.5]) {
      rotate([0,90,0]) {
	cylinder(d= HOLE_DIAM, h= STUD_DIST);
	translate([0,0,0]) {
	  cylinder(d= FLANGE_DIAM, h= FLANGE_DEPTH);
      }
	
	translate([0,0,STUD_DIST-FLANGE_DEPTH]) {
	  cylinder(d= FLANGE_DIAM, h= FLANGE_DEPTH);
      }
      }
    }
  }
}
