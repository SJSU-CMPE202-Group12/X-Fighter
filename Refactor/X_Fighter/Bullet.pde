public class Bullet {
  int xpos;
  int ypos;
  int speed = 4; // move 4 pixels per draw
  int lifetime = 60; // stay on the screen for 60 frames, i.e. 1 second
  PImage bulletImg;
  
  public Bullet(int x, int y) {
    xpos = x;
    ypos = y;
    bulletImg = loadImage("bullet.png");
    bulletImg.resize(7, 16); 
  }
  
  public boolean collideWithEnemy(Enemy ep) {
    return (xpos <= ep.getX() + ep.getWidth()/2 && xpos >= ep.getX() - ep.getWidth()/2 && ypos <= ep.getY() + ep.getHeight()/2 && ypos >= ep.getY() - ep.getHeight());
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
