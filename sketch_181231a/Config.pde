// General Config:
boolean drawEdges = true;
boolean drawGrid = true;
boolean showInfo = true;
boolean fill = true;
boolean drawMouse = false;

int numRays = 256;
int max_rays = 2048;
int min_rays = 1;

// Tile colors:
int[] col_enabled = new int[]{90, 90, 190};
int[] col_disabled = new int[]{40, 40, 40};

// Canvas size (in pixels):
int MAP_WIDTH = 16;
int MAP_HEIGHT = 16;

// Keycodes:
char KEYCODE_RESET = 'R';
char KEYCODE_TOGGLE_GRID = 'G';
char KEYCODE_TOGGLE_EDGES = 'E';
char KEYCODE_TOGGLE_FILL = 'F';
char KEYCODE_TOGGLE_INFO = 'I';
char KEYCODE_INCREASE_RAYS = 'K';
char KEYCODE_DECREASE_RAYS = 'L';
char KEYCODE_TOGGLE_CURSOR_TILE = 'C';
