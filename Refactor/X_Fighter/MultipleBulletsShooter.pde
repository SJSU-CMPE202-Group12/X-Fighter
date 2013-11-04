public class MultipleBulletsShooter extends Shooter{
  
  private Timer timer;
  
  public MultipleBulletsShooter(GameComponents gc, Fighter plane, int direction) {
    super(gc, plane, direction);
    timer = new Timer("Multiple bullets power", 20000);
    timer.start();
  }
  
  public boolean hasTimer() {
    return true;
  }

  public void shoot() {
    Bullet b = new Bullet(plane.getX(), plane.getY() - plane.getHeight()/2, direction);
    components.addChild(b);  
    Bullet bLeft = new Bullet(plane.getX() - plane.getWidth() / 2, plane.getY(), direction);
    components.addChild(bLeft);
    Bullet bRight = new Bullet(plane.getX() + plane.getWidth() / 2, plane.getY(), direction);
    components.addChild(bRight);
    if(timer.isFinished())
    {
      plane.setDefaultShooter();
    }
  }
  
}
  
  
