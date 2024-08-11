include <defs.scad>

module magnet_shell() {
rotate_extrude() {
difference() {
  union() {
    square([MAGNET_DIAM/2+WALL_THICKNESS, MAGNET_HEIGHT + TOP_THICKNESS- EDGE_RADIUS]);
    square([MAGNET_DIAM/2+WALL_THICKNESS - EDGE_RADIUS, MAGNET_HEIGHT + TOP_THICKNESS]);
    translate([MAGNET_DIAM/2+WALL_THICKNESS-EDGE_RADIUS,
	       MAGNET_HEIGHT + TOP_THICKNESS- EDGE_RADIUS]) {
      circle(r=EDGE_RADIUS);
    }
  }
   square([MAGNET_DIAM/2, MAGNET_HEIGHT]);
}
}

}

magnet_shell();
