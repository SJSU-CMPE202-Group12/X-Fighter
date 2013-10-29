class EnemyGenerator
{
  private int lastPlane; // how many frames ago did the last plane appeared
  private Level level;
  
  public EnemyGenerator()
  {
    level = new Level();
    lastPlane = level.getRatio();
  }

  private void addEnemyPlane()
  {
    Enemy enemy = new Enemy(level.getSpeed());
    gameComponents.addChild(enemy);
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
