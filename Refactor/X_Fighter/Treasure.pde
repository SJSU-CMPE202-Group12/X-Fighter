public abstract class Treasure extends Collide implements Component{
  
  protected PImage treasureImage;
  protected int life;
  protected float xpos;
  protected float ypos;
  protected Fighter plane;
  
  public Treasure(float x, float y, int lifeSpam, Fighter plane) {
    xpos = x;
    ypos = y;
    life = lifeSpam;
    this.plane = plane;
  }
  public void addChild(Component c) {}
  
  public void removeChild(Component c) {}
  
  public int getLife() {
    return life;
  }
  
  public float getX() {
    return xpos;
  }
  
  public float getY() {
    return ypos;
  }
  
  public float getWidth() {
    return treasureImage.width;
  }
  
  public float getHeight() {
    return treasureImage.height;
  }
  
  public boolean destroy() {
    life = 0;
    return true;
  }
  
  public void display() {
    if (life > 0) 
    {
      life -= 1;
      imageMode(CENTER);
      image(treasureImage, xpos, ypos); 
    }
    if(this.collision(plane))
    {
      activate();
    }
  }
   
  public abstract void activate(); 
   
}
