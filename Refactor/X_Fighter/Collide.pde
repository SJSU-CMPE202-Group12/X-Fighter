public abstract class Collide {
  public abstract float getX();  
  public abstract float getY();  
  public abstract float getWidth();
  public abstract float getHeight();
  public abstract boolean destroy();
  
  public boolean collision(Collide that) {
    float aLeft = this.getX() - this.getWidth()/2;
    float aRight = this.getX() + this.getWidth()/2;
    float aTop = this.getY() - this.getHeight()/3;
    float aBottom = this.getY() + this.getHeight()/3;
    
    float bLeft = that.getX() - that.getWidth()/2;
    float bRight = that.getX() + that.getWidth()/2;
    float bTop = that.getY() - that.getHeight()/3;
    float bBottom = that.getY() + that.getHeight()/3;
    
    return ((aLeft < bLeft && bLeft < aRight) || (bLeft < aLeft && aLeft < bRight)) &&   //overlap on x coordinate
      ((aTop < bTop && bTop < aBottom) || (bTop < aTop && aTop < bBottom));  //overlap on y coordinate
  }
}
