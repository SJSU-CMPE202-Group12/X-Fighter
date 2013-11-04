public class TreasureFactory {
  
  private float probability = 0.2;
  private int waitingTime = 0;
  private ArrayList<Class> treasurePossibilities;
  private Fighter plane;
  private float margin = 50;
  private GameComponents components;
  
  public TreasureFactory(Fighter plane, GameComponents gc) {
    this.plane = plane;
    components = gc;
    treasurePossibilities = new ArrayList();
  }
  
  public void setProbability(float probability) {
    this.probability = probability;
    treasurePossibilities.add(LifeTreasure.class);
  }
  
  private void createTreasure() {
    int treasure = int (random(treasurePossibilities.size()));
    waitingTime = 600;
    //if(treasurePossibilities.get(treasure).equals(LifeTreasure.class))
    {
      float x = random(width - 2 * margin) + margin;      
      float y = random(height - 2 * margin) + margin;
      components.addChild(new LifeTreasure(x, y, 200, plane));
    }
  }

  public void manageTreasure() {
    if(waitingTime > 0)
    {
      waitingTime--;
      return;
    }
    float p = random(1);
    if(p >= probability)
      return;
    createTreasure();
  }
    
}
