class EnemyGenerator
{
  private int lastPlane; // how many frames ago did the last plane appeared
  private Level level;
  private GameComponents enemyComponents; // a collection of bullet and enemy plane
  private Score score;
  
  public EnemyGenerator(GameComponents gc)
  {
    enemyComponents = gc;
    score = new Score();
    level = new Level();
    lastPlane = level.getRatio();
  }

  private void addEnemyPlane()
  {
    if (level.getLevel()==1){
      Enemy enemyPlaneLevel1 = new EnemyPlaneLevel1(level.getSpeed());     
      enemyComponents.addChild(enemyPlaneLevel1);    
    }
    else if(level.getLevel()==2){
      Enemy enemyPlaneLevel2 = new EnemyPlaneLevel2(level.getSpeed());     
      enemyComponents.addChild(enemyPlaneLevel2);    
    }
    else if(level.getLevel()>=3){ //when arriving level 3, the enemyplane could shooting
      Enemy enemyPlaneWithShooting = new EnemyPlaneWithShooting(level.getSpeed());
      enemyPlaneWithShooting.setShoot(enemyComponents); // enemy plane that can shoot and add bullets to the components
      enemyComponents.addChild(enemyPlaneWithShooting);
    } 
    else{}// will be implemented in future   
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
    level.levelUp(score.getScore());
  }
  
  public int getScorePoints() {
    return score.getScore();
  }
  
  public Score getScore() {
    return score;
  }
}
