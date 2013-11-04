public class MultipleBulletsTreasure extends Treasure {
  
  private GameComponents components;
  
  public MultipleBulletsTreasure(float x, float y, int lifeSpam, Fighter plane, GameComponents gc) {
    super(x, y, lifeSpam, plane);
    components = gc;
    treasureImage = loadImage("multipleBullet.png");
    treasureImage.resize(15, 15);
  }
  
  public void activate() {
    plane.setShooter(new MultipleBulletsShooter(components, plane, -1));
    life = 0;
  }
}
