import java.util.*;
MyPlane plane;
EnemyPlaneGenerator planeGenerator;
  PFont AvenirNext;

void setup() {
  //blank background
  size(300, 500);  
  AvenirNext = loadFont("AvenirNext-Regular-12.vlw");

  plane = new MyPlane(width/2, height);
  planeGenerator = new EnemyPlaneGenerator(width, height); 
  
}

void draw() {
 background(0);
String s=""+Score.counter;
textFont( AvenirNext, 12 );
textAlign( LEFT );
text("Score",10,10);
text( s, 22, 22 );

  
  plane.move();
  plane.shoot();
  plane.display();  
  planeGenerator.display();
}

