$fn=50;
SIZE=20;
BEVEL=2;
DOT_DIST=5;
DOT_DEPTH=0.5;
DOT_DIAM=4;
MAGNET_HEIGHT = 3.0;
MAGNET_DIAM = 10.3;
MAGNET_DEPTH = 1;
//multmatrix([[1,1,1,0]/sqrt(3),[0.5,-1,0.5,0]/sqrt(1.5), [1.5,0,-1.5,0]/sqrt(4.5),[0,0,0,1]]) {


module dice()
{
  difference() {
    intersection() {
      cube([SIZE,SIZE,SIZE], center=true);
      intersection_for(r=[[45,0,0],[0,45,0],[0,0,45]]) {
	rotate(r) {
	  s = SIZE*sqrt(2)-BEVEL;
	  cube([s,s,s], center=true);
	}
      }
      intersection_for(r=[[0,0,0],[0,180,0],[0,90,0],[0,0,90]]) {
	rotate(r) {
	  multmatrix([[1/sqrt(3), 1/sqrt(6), 1/sqrt(2)],
		      [1/sqrt(3), -2/sqrt(6), 0],
		      [1/sqrt(3), 1/sqrt(6),-1/sqrt(2)]]) {
	    s = SIZE*sqrt(3)-BEVEL*4/sqrt(6);
	    cube([s,s*4,s*4], center=true);
	  }
	}
      }
    }
    for(a = [[[0,0,0],[[0,0]]],
	     [[90,0,0], [[-1,-1], [1,1]]],
	     [[0,90,0], [[-1,-1], [1,1], [0,0]]],
	     [[0,270,0], [[-1,-1], [1,1], [1,-1], [-1,1]]],
	     [[270,0,0], [[-1,-1], [1,1], [1,-1], [-1,1], [0,0]]],
	     [[180,0,0], [[-1,-1], [1,1], [1,-1], [-1,1], [1,0], [-1,0]]]
	     ]) {
      rotate(a[0]) {
	for (p = a[1]) {
	  r = DOT_DEPTH/2 + DOT_DIAM*DOT_DIAM/(8*DOT_DEPTH);
	  translate([p[0]*DOT_DIST,p[1]*DOT_DIST, SIZE/2+r-DOT_DEPTH]) {
	    sphere(r=r);
	  }
      
	}
      }
    }
  }
}

module magnet_space() {
  for(a = [0,90,180,270]) {
    rotate([90,0,a]) {
      translate([0,0,SIZE/2-MAGNET_HEIGHT-MAGNET_DEPTH]) {
	cylinder(d=MAGNET_DIAM, h=MAGNET_HEIGHT);
      }
    }
  }
  cylinder(d=MAGNET_DIAM, h= SIZE/2-MAGNET_DEPTH);
}

difference() {
  intersection() {
    dice();
    
    translate([-SIZE, -SIZE,0])
      {
	cube(SIZE*2+SIZE*2, SIZE*2);
      }
  }
  magnet_space();
}

translate([SIZE*1.5,0,0]) {
  difference() {
    intersection() {
      rotate([180,0,0]) {
	dice();
      }
      translate([-SIZE, -SIZE,0])
	{
	  cube(SIZE*2+SIZE*2, SIZE*2);
	}
    }
    magnet_space();
  }
}
