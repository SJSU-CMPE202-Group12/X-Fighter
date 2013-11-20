class EnemyGenerator implements ILevelObserver, IBossObserver
{
  private int lastPlane; // how many frames ago did the last plane appeared
  protected Level level;
  private GameComponents enemyComponents; // a collection of bullet and enemy plane
  private Score score;
  private boolean bossIsPresent = false; 
  
  public EnemyGenerator(GameComponents gc)
  {
    enemyComponents = gc;
    score = new Score();
    level = new Level();
    

    lastPlane = level.getRatio();
  }
  
  public void updateObservers(){
      List<IBossObserver> observers = new ArrayList<IBossObserver>();
      observers.add((IBossObserver) level);
      observers.add((IBossObserver) this);
      Enemy boss = new BossPlane(level.getSpeed(), this, level.getLevel(), observers);     
      enemyComponents.addChild(boss);
      boss.setShoot(enemyComponents);
  }

  public void attachObserver() {
    level.attach(this);
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
    if(!bossIsPresent && lastPlane >= level.getRatio())
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
    level.act(score.getScore());
  }
  
  public int getScorePoints() {
    return score.getScore();
  }
  
  public Score getScore() {
    return score;
  }
  
  public void updateBossObserver() {
    bossIsPresent = !bossIsPresent;
  }
  
}
