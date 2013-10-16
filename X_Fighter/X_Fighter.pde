import gifAnimation.*;
import java.util.*;

Gif myAnimation;
MyPlane plane;
EnemyPlaneGenerator planeGenerator;
  PFont AvenirNext;   
   ArrayList <Boolean> collision;
   ArrayList<Explosion> explosions;

void setup() {
  //blank background
  size(300, 500);  
  AvenirNext = loadFont("AvenirNext-Regular-12.vlw");

  plane = new MyPlane(width/2, height);
  planeGenerator = new EnemyPlaneGenerator(width, height); 
  Gif Animation = new Gif(this, "Explosion.gif");
  
  collision =new ArrayList<Boolean>() ;
  collision.add(false);

   myAnimation=Animation;
   myAnimation.noLoop();

  
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
 
  if(collision.get(collision.size()-1)){
     explosions.get(explosions.size()-1).display();
  }
   
      
}

