void drawInfo() {
  int x_pos = 20;
  int y_pos = 50;
  int v_gap = 20;
  int h_gap = 300;
  fill(0, 0, 0, 200);
  rect(0, 0, width, height);
  fill(255);
  text("Command:", x_pos, y_pos);
  text("Key:", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  line(0, y_pos, width, y_pos);
  y_pos += 2*v_gap;
  text("Toggle Info:", x_pos, y_pos);
  text("[" + KEYCODE_TOGGLE_INFO + "]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Increase rays (x2):", x_pos, y_pos);
  text("[" + KEYCODE_INCREASE_RAYS + "]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Decrease rays (/2):", x_pos, y_pos);
  text("[" + KEYCODE_DECREASE_RAYS + "]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Toggle Cursor Tile:", x_pos, y_pos);
  text("[" + KEYCODE_TOGGLE_CURSOR_TILE + "]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Toggle Grid:", x_pos, y_pos);
  text("[" + KEYCODE_TOGGLE_GRID + "]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Toggle Fill:", x_pos, y_pos);
  text("[" + KEYCODE_TOGGLE_FILL + "]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Toggle Edges:", x_pos, y_pos);
  text("[" + KEYCODE_TOGGLE_EDGES + "]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Reset:", x_pos, y_pos);
  text("[" + KEYCODE_RESET + "]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Place/Remove Cell:", x_pos, y_pos);
  text("[Left Click]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Place Multiple Cells:", x_pos, y_pos);
  text("[Drag Left Button]", x_pos + h_gap, y_pos);
  y_pos += v_gap;
  text("Remove Multiple Cells:", x_pos, y_pos);
  text("[Drag Right Button]", x_pos + h_gap, y_pos);
  fill(255, 255, 0);
  y_pos += 4*v_gap;
  text("Press " + "[" + KEYCODE_TOGGLE_INFO + "]" + " to close this dialog...", x_pos, y_pos);
}
