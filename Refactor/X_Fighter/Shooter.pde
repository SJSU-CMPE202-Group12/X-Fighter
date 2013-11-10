public abstract class Shooter implements IShootStrategy {
  
  protected GameComponents components;
  protected Fighter plane;
  protected int direction;
  
  public Shooter(GameComponents gameComponents, Fighter plane, int direction) {
    components = gameComponents;
    this.plane = plane;
    this.direction = direction;
  }
  
  public abstract void shoot();
}

