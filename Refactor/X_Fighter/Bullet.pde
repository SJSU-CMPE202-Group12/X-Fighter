public class Bullet extends Collide {
  int xpos;
  int ypos;
  int speed = 4; // move 4 pixels per draw
  int lifetime = 60; // stay on the screen for 60 frames, i.e. 1 second
  PImage bulletImg;
  
  public Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletImg = loadImage("bullet.png");
    bulletImg.resize(5, 12); 
  }
  
  int getX(){
    return xpos;
  }
  
  int getY(){
    return ypos;
  }
  
  int getWidth(){
    return bulletImg.width;
  }
  
  int getHeight(){
    return bulletImg.height;
  }
  
  public void display() {
    if (lifetime > 0) {
      lifetime -= 1;
      ypos -= speed;
      imageMode(CENTER);
      image(bulletImg, xpos, ypos); 
    }
  }
}
