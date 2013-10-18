public class Bullet extends Collide {
  float xpos;
  float ypos;
  float speed = 4; // move 4 pixels per draw
  float lifetime = 60; // stay on the screen for 60 frames, i.e. 1 second
  PImage bulletImg;
  
  public Bullet(float x, float y) {
    xpos = x;
    ypos = y;
    bulletImg = loadImage("bullet.png");
    bulletImg.resize(5, 12); 
  }
  
  float getX(){
    return xpos;
  }
  
  float getY(){
    return ypos;
  }
  
  float getWidth(){
    return bulletImg.width;
  }
  
  float getHeight(){
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
