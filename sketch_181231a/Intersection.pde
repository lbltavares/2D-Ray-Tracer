int DONT_INTERSECT = 0;
int COLLINEAR = 1;
int DO_INTERSECT = 2;
float x = 0, y = 0;


int intersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

  float a1, a2, b1, b2, c1, c2;
  float r1, r2, r3, r4;
  float denom, offset, num;

  a1 = y2 - y1;
  b1 = x1 - x2;
  c1 = (x2 * y1) - (x1 * y2);

  r3 = ((a1 * x3) + (b1 * y3) + c1);
  r4 = ((a1 * x4) + (b1 * y4) + c1);

  if ((r3 != 0) && (r4 != 0) && same_sign(r3, r4)) {
    return DONT_INTERSECT;
  }

  a2 = y4 - y3;
  b2 = x3 - x4;
  c2 = (x4 * y3) - (x3 * y4);

  r1 = (a2 * x1) + (b2 * y1) + c2;
  r2 = (a2 * x2) + (b2 * y2) + c2;

  if ((r1 != 0) && (r2 != 0) && (same_sign(r1, r2))) {
    return DONT_INTERSECT;
  }

  denom = (a1 * b2) - (a2 * b1);

  if (denom == 0) {
    return COLLINEAR;
  }

  if (denom < 0) { 
    offset = -denom / 2;
  } else {
    offset = denom / 2 ;
  }

  num = (b1 * c2) - (b2 * c1);
  if (num < 0) {
    x = (num - offset) / denom;
  } else {
    x = (num + offset) / denom;
  }

  num = (a2 * c1) - (a1 * c2);
  if (num < 0) {
    y = ( num - offset) / denom;
  } else {
    y = (num + offset) / denom;
  }

  return DO_INTERSECT;
}

boolean same_sign(float a, float b) {
  return (( a * b) >= 0);
}
