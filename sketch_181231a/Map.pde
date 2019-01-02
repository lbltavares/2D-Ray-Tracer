class Map {

  Tile[][] tiles;
  int w, h;

  Map(int w, int h) {
    this.w = w;
    this.h = h;
    tiles = new Tile[w][h];
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        setTile(x, y, new Tile(false));
      }
    }
  }

  PVector getCoord(int x, int y) {
    PVector ts = tileSize();
    return new PVector(x / ts.x, y / ts.y);
  }

  PVector tileSize() {
    return new PVector(width/w, height/h);
  }

  void toggle(int x, int y) {
    if (x >= 0 && x < w && y >= 0 && y < h)
      getTile(x, y).enabled = !getTile(x, y).enabled;
  }

  void toggle(int x, int y, boolean b) {
    if (x >= 0 && x < w && y >= 0 && y < h)
      getTile(x, y).enabled = b;
  }

  void setTile(int x, int y, Tile tile) {
    if (x >= 0 && x < w && y >= 0 && y < h)
      tiles[x][y] = tile;
  }

  Tile getTile(int x, int y) {
    return tiles[x][y];
  }

  void reset() {
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        toggle(x, y, false);
      }
    }
  }

  void render() {
    int tw = width/w;
    int th = height/h;
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        if (tiles[x][y] != null)
          tiles[x][y].render(x*tw, y*th, tw, th);
      }
    }

    // Render mouse:
    noFill();
    stroke(255);
    if (drawMouse) {
      rect(mouseX/tw * tw, mouseY/th * th, tw, th);
    }
  }
}
