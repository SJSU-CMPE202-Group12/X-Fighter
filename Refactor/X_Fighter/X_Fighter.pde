import java.util.*;

final PApplet xFighter = this;
GameBoard board;
FighterControl fighterControl;

public void setup() {
  size(300, 500);
  background(0);
  
  board = new GameBoard(width, height);
  fighterControl = new FighterControl();
}

public void draw() {
  background(0);
  board.getState().draw();
  board.mousePressed();
}


void keyPressed() {      
   if (key == CODED) {
     if (keyCode == LEFT)
        fighterControl.setLeftKey();       
     if (keyCode == RIGHT ) 
        fighterControl.setRightKey();           
     if (keyCode == UP ) 
        fighterControl.setUpKey();       
      if (keyCode == DOWN) 
        fighterControl.setDownKey();         
   }
} 

void keyReleased(){
  if (key == CODED) {
    if (keyCode == UP) 
      fighterControl.releaseUpKey();
    if (keyCode == DOWN) 
      fighterControl.releaseDownKey();
    if (keyCode == LEFT) 
          fighterControl.releaseLeftKey();
    if (keyCode == RIGHT) 
          fighterControl.releaseRightKey();
   }
 }
