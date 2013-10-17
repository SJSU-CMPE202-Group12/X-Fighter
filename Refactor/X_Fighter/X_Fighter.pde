import java.util.*;

static PApplet xFighter;
GameBoard board;

public void setup() {
  size(300, 500);
  background(0);
  
  board = new GameBoard(width, height); 
  xFighter = this;
}

public void draw() {
  background(0);
  board.getState().draw();
  board.mousePressed();
}
