class EnemyGenerator
{
  private int lastPlane; // how many frames ago did the last plane appeared
  private Level level;
  private GameComponents enemyComponents;
  
  public EnemyGenerator(GameComponents gc)
  {
    level = new Level();
    lastPlane = level.getRatio();
    enemyComponents = gc;
  }

  private void addEnemyPlane()
  {
    Enemy enemy = new Enemy(level.getSpeed());
    enemyComponents.addChild(enemy);
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
  
  public void update()
  {
    generateEnemyPlane();    
    level.levelUp(Score.COUNTER);
  }
}
