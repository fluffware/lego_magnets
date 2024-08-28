include <defs.scad>
include <lego_defs.scad>
use <magnet_shell.scad>

OUTER_DIAM = 7.5;

magnet_shell();

function tangent(r, bx,by) = [r*r*bx + r*by * sqrt(by*by+bx*bx - r*r), r*r*by + r*bx * sqrt(by*by+bx*bx - r*r)] / (by*by+bx*bx);

difference() {
  union() {
    for (y=[-STUD_DIST/2, STUD_DIST/2]) {
      translate([-STUD_DIST/2+GAP,y,STUD_DIST*1.5]) {
	rotate([0,90,0]) {
	  cylinder(d=OUTER_DIAM, h=STUD_DIST-2*GAP);
	}
      }
    }
    echo([tangent(-OUTER_DIAM/2, 0, -STUD_DIST*1.5+MAGNET_HEIGHT)]);
    translate([-STUD_DIST/2+GAP,0,0]) {
      rotate([90,0,90]) {
	linear_extrude(height=STUD_DIST-2*GAP) {
	  polygon([tangent(OUTER_DIAM/2, 0, -STUD_DIST*1.5+MAGNET_HEIGHT) + [-STUD_DIST/2, STUD_DIST*1.5],
		   [-STUD_DIST/2, STUD_DIST*1.5+OUTER_DIAM/2],
		   [STUD_DIST/2, STUD_DIST*1.5+OUTER_DIAM/2],
		   tangent(-OUTER_DIAM/2, 0, -STUD_DIST*1.5+MAGNET_HEIGHT) + [STUD_DIST/2, STUD_DIST*1.5],
		   [STUD_DIST/2, MAGNET_HEIGHT], [-STUD_DIST/2, MAGNET_HEIGHT]]) ;
	}
      }
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
