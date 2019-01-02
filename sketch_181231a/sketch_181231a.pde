Map map;
PolyMap polyMap;

void setup() {
  size(512, 512);
  noCursor();

  map = new Map(MAP_WIDTH, MAP_HEIGHT);

  map.toggle(3, 5, true);
  map.toggle(5, 5, true);
  map.toggle(7, 5, true);
  map.toggle(9, 5, true);
  map.toggle(11, 5, true);
  map.toggle(13, 5, true);

  map.toggle(2, 5, true);
  map.toggle(2, 6, true);
  map.toggle(2, 7, true);
  map.toggle(2, 8, true);
  map.toggle(2, 9, true);
  map.toggle(2, 13, true);

  map.toggle(11, 0, true);
  map.toggle(12, 0, true);
  map.toggle(13, 0, true);
  map.toggle(14, 0, true);
  map.toggle(15, 0, true);
  map.toggle(16, 0, true);

  map.toggle(11, 1, true);
  map.toggle(11, 2, true);
  map.toggle(11, 3, true);
  map.toggle(11, 4, true);

  map.toggle(14, 5, true);
  map.toggle(15, 5, true);

  map.toggle(3, 13, true);
  map.toggle(5, 13, true);
  map.toggle(7, 13, true);
  map.toggle(9, 10, true);
  map.toggle(11, 10, true);
  map.toggle(13, 10, true);

  polyMap = new PolyMap(map);
  polyMap.update();
}

void draw() {
  clear();
  map.render();
  if (drawEdges)
    polyMap.render();

  int distance = 500;
  int x1 = mouseX;
  int y1 = mouseY;
  for (int i = 0; i < numRays; i++) {
    float x2 = x1 + sin((2 * i * PI)/numRays) * distance;
    float y2 = y1 + cos((2 * i * PI)/numRays) * distance;

    float min_dist = Float.MAX_VALUE;
    float min_x = Float.MAX_VALUE, min_y = Float.MAX_VALUE;

    for (Edge e : polyMap.edges) {
      int intersected = intersect(x1, y1, x2, y2, e.x1, e.y1, e.x2, e.y2);
      if (intersected == DO_INTERSECT) {
        float dist = sqrt((x-x1)*(x-x1)+(y-y1)*(y-y1));
        if (dist < min_dist) {
          min_dist = dist;
          min_x = x;
          min_y = y;
        }
      }
    }
    if (min_dist != Float.MAX_VALUE) {
      x2 = min_x;
      y2 = min_y;
    }
    line(x1, y1, x2, y2);
    ellipse(x2, y2, 5, 5);
  }
  if (showInfo)
    drawInfo();
}

void mouseDragged(MouseEvent e) {
  PVector m = map.getCoord(e.getX(), e.getY());
  if (e.getButton() == LEFT) {
    map.toggle((int)m.x, (int)m.y, true);
  } else if (e.getButton() == RIGHT) {
    map.toggle((int)m.x, (int)m.y, false);
  }
  polyMap.reset();
  polyMap.update();
}

void mouseClicked(MouseEvent e) {
  PVector m = map.getCoord(e.getX(), e.getY());
  map.toggle((int)m.x, (int)m.y);
  polyMap.reset();
  polyMap.update();
}

void mouseMoved(MouseEvent e) {
}

void keyPressed(KeyEvent e) {
  if (keyCode == KEYCODE_RESET) {
    map.reset();
    polyMap.reset();
  } else if (keyCode == KEYCODE_TOGGLE_GRID)
    drawGrid = !drawGrid;
  else if (keyCode == KEYCODE_TOGGLE_EDGES)
    drawEdges = !drawEdges;
  else if (keyCode == KEYCODE_TOGGLE_FILL)
    fill = !fill;
  else if (keyCode == KEYCODE_TOGGLE_INFO)
    showInfo = !showInfo;
  else if (keyCode == KEYCODE_INCREASE_RAYS && numRays < max_rays)
    numRays*=2;
  else if (keyCode == KEYCODE_DECREASE_RAYS && numRays > min_rays)
    numRays/=2;
  else if (keyCode == KEYCODE_TOGGLE_CURSOR_TILE)
    drawMouse = !drawMouse;
}
