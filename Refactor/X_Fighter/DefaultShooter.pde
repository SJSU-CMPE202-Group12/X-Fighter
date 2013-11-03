public class DefaultShooter extends Shooter {
  
  public DefaultShooter(GameComponents gc, Fighter plane, int direction) {
    super(gc, plane, direction);
  }
  
  public void shoot()
  {
    Bullet b = new Bullet(plane.getX(), plane.getY() - plane.getHeight()/2, direction);
    components.addChild(b);  
  }
}
