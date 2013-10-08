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

class Bullet {
  int xpos;
  int ypos;
  int speed = 4; // move 4 pixels per draw
  int lifetime = 60; // stay on the screen for 60 frames, i.e. 1 second
  PImage bulletImg;
  
  Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletImg = loadImage("bullet.png");
    bulletImg.resize(7, 16); 
  }
  
  boolean collideWithEnemy(EnemyPlane ep) {
    return (xpos <= ep.getX() + ep.getWidth()/2 && xpos >= ep.getX() - ep.getWidth()/2 && ypos <= ep.getY() + ep.getHeight()/2 && ypos >= ep.getY() - ep.getHeight());
  }
  
  void display() {
    if (lifetime > 0) {
      lifetime -= 1;
      ypos -= speed;
      imageMode(CENTER);
      image(bulletImg, xpos, ypos); 
    }
  }
}
import java.util.*;

class EnemiesControl
{
  private int maxY; // max y coordinate that the plane can go
  
  private Set<EnemyPlane> enemies; // keeps all the planes it will control
  
  /*
  * rangeY is the max coordinate that the plane should appear
  */
  public EnemiesControl(int rangeY)
  {
    enemies = new HashSet<EnemyPlane>();
    maxY = rangeY;
  }
  
  public void add(EnemyPlane enemy)
  {
    enemies.add(enemy);
  }
  
  public void remove(EnemyPlane enemy)
  {
    enemies.remove(enemy);
  }
  
  public void move()
  {
    // may remove multiplane at a time
    Set<EnemyPlane> removePlanes = new HashSet<EnemyPlane>();
    
    for(EnemyPlane e : enemies)
    {
      // detect collision between the bullets and enemy plane
      for(Bullet b : plane.bullets)
      {
        if(b.collideWithEnemy(e))
        {
          b.lifetime = 0;
          removePlanes.add(e);
          Score.counter++;
        }
      }
      
      e.display();
      e.move();
      if(e.getY() - e.getHeight() / 2 > maxY)
      {
        removePlanes.add(e);
      }
    }
    
    // remove enemy planes that touch the bottom or collide with a bullet
    for(EnemyPlane e : removePlanes)
    {      
      this.remove(e);
    }
  }
}
import java.util.Random;

class EnemyPlane
{
  private int x; // x coordinate of front of plane 
  private int y; // y coordinate of front of plane
  private int maxX; // max x coordinate that the plane can appear
  private int size; // distance from midle of plane to end of "wing"
  private int planeHeight; //heigh of plane
  private int planeSpeed; // speed of plane
  PImage image;
  
  /*
  * rangeX is the max x coordinate that the plane can appear
  */
  public EnemyPlane(int rangeX, int speed)
  {
    size = 15;
    planeHeight = 2 * size;
    y = planeHeight;
    planeSpeed = speed;
    maxX = rangeX;
    Random r = new Random();
    x = r.nextInt(maxX - size - 1) + size; 
    image = loadImage("EnemyPlaneImage.png");
    image.resize(getWidth(), getHeight());
  }
  
  /*
  * return the x coordinate of center of plane
  */
  public int getX()
  {
    return x;
  }

  /*
  * return the y coordinate of center of plane
  */  
  public int getY()
  {
    return y + planeHeight / 2;
  }
  
  /*
  * return width of plane
  */
  public int getWidth()
  {
    return 2 * size;
  }
  
  /*
  * return height of plane
  */
  public int getHeight()
  {
    return planeHeight;
  }
  
  public void display()
  {
    imageMode(CENTER);  
    image(image, x, y); 
  }
  
  public void move()
  {
    y += planeSpeed;
    display();
  }
}
class EnemyPlaneGenerator
{
  private int ratio; // how many frames untill next plane appears
  private int lastPlane; // how many frames ago did the last plane appeared
  private int maxX; // max x coordinate that the plane can appear
  private int maxY; // max y coordinate that the plane can go
  private int planeSpeed; // speed that the planes generated will move
  private EnemiesControl control;
  
  /*
  * rangeX is the max x coordinate that the plane can appear
  * rangeY is the max y coordinate that the plane can appear
  */
  public EnemyPlaneGenerator(int rangeX, int rangeY)
  {
    ratio = 100;
    maxX = rangeX;
    planeSpeed = 1;
    lastPlane = ratio;
    control = new EnemiesControl(rangeY);
  }
  
  public void setPlaneSpeed(int speed)
  {
    planeSpeed = speed;
  }
  
  /*
  * set how many frames until next plane appears
  */
  public void setRatio(int ratio)
  {
    this.ratio = ratio;
  }
  
  private void addEnemyPlane()
  {
    EnemyPlane enemy = new EnemyPlane(maxX, planeSpeed);
    control.add(enemy);
    lastPlane = 0;
  }
  
  private void generateEnemyPlane()
  {
    lastPlane++;
    if(lastPlane >= ratio)
   {
     addEnemyPlane();
   } 
  }
  
  public void display()
  {
    generateEnemyPlane();
    control.move();
  }
}
class GameBoard
{
  int width;
  int height;
  
  
  
  void draw() {
    
  }
}
// class for my plane

class MyPlane {
  int xpos;  //x coordinate of center of my plane
  int ypos;  // y coordinate of center of my plane
  int speed = 2; // move 2 pixels per frame if the arrow key is pressed
  int shootRate = 15; // shoot one bullet every 15 frames
  int nextShoot = 0;  // when to shoot the next bullet
  int size = 25;
  int planeHeight = 2 * size;
  ArrayList<Bullet> bullets;
  PImage myPlaneImg;

  MyPlane(int x, int y) {
    bullets = new ArrayList<Bullet>();
    myPlaneImg = loadImage("myplane.png");
    myPlaneImg.resize(getWidth(), getHeight()); 
    xpos = x;
    ypos = y - getHeight()/2;
       
  }
  
  int getX(){
    return xpos;
  }
  
  int getY(){
    return ypos;
  }
  
  int getWidth(){
    return 2 * size;
  }
  
  int getHeight(){
    return planeHeight;
  }
  
  void shoot() {    
    if (nextShoot == 0) {
      nextShoot = shootRate;
      bullets.add(new Bullet(xpos, ypos - getHeight()/2));
    }
    nextShoot -= 1;
  }

  // remove the bullet that run out of lifetime and display others
  void updateBullet()
  {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      if (b.lifetime == 0)
        bullets.remove(i);
      else
        b.display();
    }
  }

  //plane is controled by arrow keys;
  void move()
  {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT && (plane.xpos - getWidth()/2 - plane.speed) > 0) 
          plane.xpos -= plane.speed;

        if (keyCode == RIGHT && (plane.xpos + getWidth()/2 + plane.speed) < width) 
          plane.xpos += plane.speed;

        if (keyCode == UP && (plane.ypos - getHeight()/2 - plane.speed) > 0) 
          plane.ypos -= plane.speed;

        if (keyCode == DOWN && (plane.ypos + getHeight()/2 + plane.speed) < height) 
          plane.ypos += plane.speed;
      }
    }
  }
    
  void display() {  
    imageMode(CENTER);  
    image(myPlaneImg, xpos, ypos); 
    updateBullet();
  }
}


public static class Score{
public static int counter=0;
}

