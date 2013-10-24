import java.util.*;

final PApplet xFighter = this;
GameBoard board;
FighterControl fighterControl;
PImage bg;

public void setup() {
  size(300, 500);
  noStroke();
  
  bg = loadImage("space1.jpg");
  background(bg);
  
  board = new GameBoard(width, height);
  fighterControl = new FighterControl();
}

public void draw() {
  background(bg);
  
  board.getState().draw();
  board.mousePressed();
}


void keyPressed() { 
   if (key=='a'||key=='A'){
     fighterControl.setSpeed(4);
   }   
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
  if (key=='a'||key=='A'){
     fighterControl.setSpeed(2);
   }
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
