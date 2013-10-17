import java.util.*;

final PApplet xFighter = this;
GameBoard board;

public void setup() {
  size(300, 500);
  background(0);
  
  board = new GameBoard(width, height);
}

public void draw() {
  background(0);
  board.getState().draw();
  board.mousePressed();
}
