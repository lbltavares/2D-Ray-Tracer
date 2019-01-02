 class Tile {   //<>//
   boolean enabled;

  // For Polymap:
   boolean has_edge[];
   int edge_id[];

   Tile(boolean enabled) {
    this.enabled = enabled;
    has_edge = new boolean[4];
    edge_id = new int[4];
  }

   void render(int x, int y, int w, int h) {
    if (!drawGrid || enabled)
      noStroke();
    else
      stroke(50, 50, 50);
    if (enabled && fill)
      fill(col_enabled[0], col_enabled[1], col_enabled[2]);
    else
      fill(col_disabled[0], col_disabled[1], col_disabled[2]);


    rect(x, y, w, h);
  }
}
