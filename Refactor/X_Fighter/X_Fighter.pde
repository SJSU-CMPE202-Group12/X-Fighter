import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import java.util.*;

Minim minim;//audio context

final PApplet xFighter = this;
GameBoard board;
FighterControl fighterControl;
PImage bg;

public void setup() {
  size(300, 500);
  noStroke();
    minim = new Minim(this);

  bg = loadImage("background.jpg");
  background(bg);
  
  board = new GameBoard(width, height);
  fighterControl = new FighterControl();
}

public void draw() {
  background(bg);
  board.getState().draw();
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
void mousePressed() {
  board.mousePressed();
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
