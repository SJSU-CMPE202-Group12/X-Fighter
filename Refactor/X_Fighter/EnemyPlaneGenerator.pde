class EnemyGenerator
{
  private int lastPlane; // how many frames ago did the last plane appeared
  private int maxX; // max x coordinate that the plane can appear
  private int maxY; // max y coordinate that the plane can go
  private EnemyControl control;
  private Level level;
  
  /*
  * rangeX is the max x coordinate that the plane can appear
  * rangeY is the max y coordinate that the plane can appear
  */
  public EnemyGenerator(int rangeX, int rangeY)
  {
    maxX = rangeX;
    level = new Level();
    lastPlane = level.getRatio();
    control = new EnemyControl(rangeY);
  }
  
  private void addEnemyPlane()
  {
    Enemy enemy = new Enemy(maxX, level.getSpeed());
    control.add(enemy);
    lastPlane = 0;
  }
  
  private void generateEnemyPlane()
  {
    lastPlane++;
    if(lastPlane >= level.getRatio())
   {
     addEnemyPlane();
   } 
  }
  
  public int getLevel()
  {
    return level.getLevel();
  }
  
  public int getNextLevelPoints()
  {
    return level.getNextLevelPoints();
  }
  
  public void display(Fighter fighter)
  {
    generateEnemyPlane();
    control.move(fighter);
    level.levelUp(Score.counter);
  }
}
