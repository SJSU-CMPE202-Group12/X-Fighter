public abstract class Treasure extends Collide implements Component{
  
  protected PImage treasureImage;
  protected int life;
  protected float xpos;
  protected float ypos;
  protected Fighter plane;
  protected Blink blink;
  
  public Treasure(float x, float y, int lifeSpam, Fighter plane) {
    xpos = x;
    ypos = y;
    life = lifeSpam;
    this.plane = plane;
    blink = new Blink(lifeSpam / 2, true);
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
      if(blink.display(life))
      {
        imageMode(CENTER);
        image(treasureImage, xpos, ypos);
      } 
    }
    if(this.collision(plane))
    {
      activate();
    }
  }
   
  public abstract void activate(); 
   
}
