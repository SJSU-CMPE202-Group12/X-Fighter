public class Button {
  int x, y;
  String label;
  String eventName;
  int align = CENTER;

  Button(int x, int y, String label, String eventName, int align) {
    this.x = x;
    this.y = y;
    this.label = label;
    this.eventName = eventName;
    this.align = align;
  }
  
  Button(int x, int y, String label, String eventName) {
    this(x, y, label, eventName, CENTER);
  }
  
  private int getActualX() {
    if(align == CENTER) {
      return x - (int)textWidth(label) / 2;
    } else {
      return x;
    }
  }

  public void draw() {
    if (over()) {
      fill(100);
    } else {
      fill(255);
    }
    textAlign(align);
    text(label, x, y + 20);
  }

  boolean over() {
    if (mouseX >= getActualX() && mouseY >= y && mouseX <= getActualX() + textWidth(label)
        && mouseY <= y + 22) {
      return true;
    }
    return false;
  }
}
