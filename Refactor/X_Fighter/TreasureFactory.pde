public class TreasureFactory {
  
  private float probability = 0.15;
  private int waitingTime;
  private ArrayList<Class> treasurePossibilities;
  private Fighter plane;
  private float margin = 50;
  private GameComponents components;
  private GameComponents fighterComponents;
  
  public TreasureFactory(Fighter plane, GameComponents gc, GameComponents fighterComponents) {
    this.plane = plane;
    components = gc;
    this.fighterComponents = fighterComponents;
    treasurePossibilities = new ArrayList();
    treasurePossibilities.add(LifeTreasure.class);
    treasurePossibilities.add(MultipleBulletsTreasure.class);
    resetWaitingTime();
  }
  
  public void setProbability(float probability) {
    this.probability = probability;
  }
  
  private void createTreasure() {
    int treasure = int (random(treasurePossibilities.size()));
    int lifeSpam = 400;
    float x = random(width - 2 * margin) + margin;      
    float y = random(height - 2 * margin) + margin;
    if(treasurePossibilities.get(treasure) == LifeTreasure.class)
    {
      components.addChild(new LifeTreasure(x, y, lifeSpam, plane));
      return;
    }
    if(treasurePossibilities.get(treasure) == MultipleBulletsTreasure.class)
    {
      components.addChild(new MultipleBulletsTreasure(x, y, lifeSpam, plane, fighterComponents));
      return;
    }
  }

  private void resetWaitingTime() {
    waitingTime = 200;
  }
  
  public void manageTreasure() {
    if(waitingTime > 0)
    {
      waitingTime--;
      return;
    }
    float p = random(1);
    if(p < probability)
      createTreasure();
    resetWaitingTime();
  }
    
}
