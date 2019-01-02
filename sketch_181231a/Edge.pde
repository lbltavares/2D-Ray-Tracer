 class Edge {

   static final int UP = 0;
   static final int DOWN = 1;
   static final int LEFT = 2;
   static final int RIGHT = 3;

   int x1, x2, y1, y2;

   Edge(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
  }
}
