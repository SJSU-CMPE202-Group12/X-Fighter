public abstract class Collide {
  public abstract int getX();  
  public abstract int getY();  
  public abstract int getWidth();
  public abstract int getHeight();
  
  public boolean collision(Collide that) {
    int aLeft = this.getX() - this.getWidth()/2;
    int aRight = this.getX() + this.getWidth()/2;
    int aTop = this.getY() - this.getHeight()/3;
    int aBottom = this.getY() + this.getHeight()/3;
    
    int bLeft = that.getX() - that.getWidth()/2;
    int bRight = that.getX() + that.getWidth()/2;
    int bTop = that.getY() - that.getHeight()/3;
    int bBottom = that.getY() + that.getHeight()/3;
    
    return ((aLeft < bLeft && bLeft < aRight) || (bLeft < aLeft && aLeft < bRight)) &&   //overlap on x coordinate
      ((aTop < bTop && bTop < aBottom) || (bTop < aTop && aTop < bBottom));  //overlap on y coordinate
  }
}
