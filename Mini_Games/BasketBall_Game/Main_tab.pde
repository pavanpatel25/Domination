BASKETBALL b;
void setup() {
  size(displayWidth, displayHeight);
  b = new BASKETBALL();
}

void draw() {
  b.game();
  b.mouseClicked();
}

