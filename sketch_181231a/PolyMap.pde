class PolyMap {

  Map map;
  ArrayList<Edge> edges;

  PolyMap(Map map) {
    this.map = map;
    edges = new ArrayList();
  }

  void reset() {
    edges.clear();
    for (int y = 0; y < map.h; y++) {
      for (int x = 0; x < map.w; x++) {
        for (int i = 0; i < 4; i++)
          map.getTile(x, y).edge_id[i] = -1;
        for (int i = 0; i < 4; i++)
          map.getTile(x, y).has_edge[i] = false;
      }
    }
  }

  void update() {
    int tw = width / map.w;
    int th = height / map.h;

    for (int y = 0; y < map.h; y++) {
      for (int x = 0; x < map.w; x++) {
        Tile i = map.getTile(x, y);  // current
        Tile u = y == 0? new Tile(false): map.getTile(x, y-1); // up
        Tile d = y == map.h - 1? new Tile(false): map.getTile(x, y+1); // down
        Tile l = x == 0? new Tile(false): map.getTile(x-1, y); // left
        Tile r = x == map.w - 1? new Tile(false): map.getTile(x+1, y); // right
        if (i.enabled) {

          // Left Tile
          if (!l.enabled) {
            if (u.has_edge[Edge.LEFT]) {
              edges.get(u.edge_id[Edge.LEFT]).y2 += th;
              i.edge_id[Edge.LEFT] = u.edge_id[Edge.LEFT];
              i.has_edge[Edge.LEFT] = true;
            } else {
              Edge edge = new Edge(x*tw, y*th, x*tw, y*th+th);
              int edgeId = edges.size();
              edges.add(edge);
              i.edge_id[Edge.LEFT] = edgeId;
              i.has_edge[Edge.LEFT] = true;
            }
          }

          // Up Tile
          if (!u.enabled) {
            if (l.has_edge[Edge.UP]) {
              edges.get(l.edge_id[Edge.UP]).x2 += tw;
              i.edge_id[Edge.UP] = l.edge_id[Edge.UP];
              i.has_edge[Edge.UP] = true;
            } else {
              Edge edge = new Edge(x*tw, y*th, x*tw+tw, y*th);
              int edgeId = edges.size();
              edges.add(edge);
              i.edge_id[Edge.UP] = edgeId;
              i.has_edge[Edge.UP] = true;
            }
          }

          // Right Tile
          if (!r.enabled) {
            if (u.has_edge[Edge.RIGHT]) {
              edges.get(u.edge_id[Edge.RIGHT]).y2 += th;
              i.edge_id[Edge.RIGHT] = u.edge_id[Edge.RIGHT];
              i.has_edge[Edge.RIGHT] = true;
            } else {
              Edge edge = new Edge(x*tw+tw, y*th, x*tw+tw, y*th+th);
              int edgeId = edges.size();
              edges.add(edge);
              i.edge_id[Edge.RIGHT] = edgeId;
              i.has_edge[Edge.RIGHT] = true;
            }
          }

          // Down Tile
          if (!d.enabled) {
            if (l.has_edge[Edge.DOWN]) {
              edges.get(l.edge_id[Edge.DOWN]).x2 += tw;
              i.edge_id[Edge.DOWN] = l.edge_id[Edge.DOWN];
              i.has_edge[Edge.DOWN] = true;
            } else {
              Edge edge = new Edge(x*tw, y*th+th, x*tw+tw, y*th+th);
              int edgeId = edges.size();
              edges.add(edge);
              i.edge_id[Edge.DOWN] = edgeId;
              i.has_edge[Edge.DOWN] = true;
            }
          }
        }
      }
    }
  }

  void render() {
    fill(col_disabled[0], col_disabled[1], col_disabled[2]);
    stroke(255, 255, 255);
    for (int i = 0; i < edges.size(); i++) {
      Edge e = (Edge)edges.get(i);
      line(e.x1, e.y1, e.x2, e.y2);
      ellipse(e.x1, e.y1, 5, 5);
      ellipse(e.x2, e.y2, 5, 5);
    }
  }
}


































//
