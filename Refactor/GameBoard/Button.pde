public class Button {
  int x, y;
  String label;
  String eventName;

  Button(int x, int y, String label, String eventName) {
    this.x = x;
    this.y = y;
    this.label = label;
    this.eventName = eventName;
  }

  public void draw() {
    fill(0);
    if (over()) {
      fill(200);
    }
    rect(x, y, textWidth(label), 25);
    fill(255);
    text(label, x, y + 20);
  }

  boolean over() {
    if (mouseX >= x && mouseY >= y && mouseX <= x + textWidth(label)
        && mouseY <= y + 22) {
      return true;
    }
    return false;
  }
}
