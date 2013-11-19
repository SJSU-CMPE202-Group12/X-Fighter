public class LifeTreasure extends Treasure {
 
  int lifeQuantity = 1;
  
  public LifeTreasure(float x, float y, int lifeSpam, Fighter plane) {
    super(x, y, lifeSpam, plane);
    treasureImage = loadImage("myplane.png");
    
    treasureImage.resize(15, 15);
  } 
 
  public void activate() {
    plane.increaseLife(lifeQuantity);
    life = 0;
  }
}
