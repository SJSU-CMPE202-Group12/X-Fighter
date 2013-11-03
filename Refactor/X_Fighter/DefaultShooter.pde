public class DefaultShooter implements IShootDecorator {
  
  private GameComponents components;
  
  public DefaultShooter(GameComponents gameComponents) {
    components = gameComponents;
  }
  
  public void shoot(float x, float y, int direction)
  {
    Bullet b = new Bullet(x, y, direction);
    components.addChild(b);  
  }
}
