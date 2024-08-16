include <defs.scad>
include <lego_defs.scad>
use <magnet_shell.scad>

OUTER_DIAM = 7.5;

magnet_shell();

difference() {
  union() {
    translate([-STUD_DIST/2+GAP,0,STUD_DIST*1.5]) {
      rotate([0,90,0]) {
	cylinder(d=OUTER_DIAM, h=STUD_DIST-2*GAP);
      }
    }
    
    translate([-STUD_DIST/2+GAP,-OUTER_DIAM/2,MAGNET_HEIGHT]) {
      cube([STUD_DIST-2*GAP, OUTER_DIAM,STUD_DIST*1.5-MAGNET_HEIGHT]);
    }
  }
  
 translate([-STUD_DIST/2,0, STUD_DIST*1.5]) {
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
