public class Bullet extends Collide implements IComponent {
  float xpos;
  float ypos;
  float speed = 4; // move 4 pixels per draw
  int lifetime = 60; // stay on the screen for 60 frames, i.e. 1 second
  PImage bulletImg;
  int direction; // moving direction of the bullet, -1 means moving upwards, 1 means moving downwards
  
  public Bullet(float x, float y, int d) {
    xpos = x;
    ypos = y;
    direction = d;
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
  
  void addChild(IComponent c){
    // no implementation
  }
  void removeChild(IComponent c){
    // no implementation
  }
  
  int getLife(){
    return lifetime;
  }
  
  boolean destroy(){
    lifetime = 0;
    return true;
  }
  
  void display() {
    if (lifetime > 0) {  
      lifetime -= 1;
      ypos += direction * speed;
      imageMode(CENTER);
      image(bulletImg, xpos, ypos); 
    }
  }
  
  void setLifeTime(int newLifeTime) {
    lifetime = newLifeTime;
  }
}
