public abstract class TimedShooter extends Shooter{
    
  protected Timer timer;
  protected int powerAddTime = 20000;
  
  public TimedShooter(GameComponents gc, Fighter plane, int direction) {
    super(gc, plane, direction);
    timer = new Timer("Timed bullets power", powerAddTime);
    timer.start();
  }
  
  public void increaseTime() {
    timer.increaseTime(powerAddTime);
  }
  
  public int getTimeLeft() {
    return timer.getTimeLeft();
  }
  
  public abstract void shoot();
}
