public class BossPlane extends EnemyPlaneWithShooting implements IBossSubject{

  private EnemyGenerator enemyGenerator;
  private int moveX = -1;
  private int directionX = 1;
  private int directionY = 1;
  private int moveY = -1;
  private List<IBossObserver> bossObservers;
  
  public BossPlane(float speed, EnemyGenerator enemyGenerator, int lives, List<IBossObserver> bossObservers)
  {     
    super(speed);
    this.enemyGenerator = enemyGenerator;
    enemyImg = loadImage("boss.png");
    enemyImg.resize(50, 40);
    setLive(lives);   //enemy plane has three life. 
    shootRate = 20;
    this.bossObservers = bossObservers;
    ((IBossSubject) this).notifyBossObserver(true);
  } 

   public boolean destroy()
  {
    live -= 1;
   
     if(live==0){
       notifyBossObserver(false);
     return true;
     }
     else
     return false; 
  }

  public void increaseScore(Score s) {
    s.increaseScore(3);
  }

  private void getDirectionX() {
    float direction = random(-1, 1);
    float x;
    if(direction < 0)
    {
      
      directionX = -1;
      moveX = (int) ((xpos - random(0, xpos)) / planeSpeed);;
    }
    else
    {
      directionX = 1;
      moveX = (int) ((random(xpos, width) - xpos) / planeSpeed);
    }
  }
  
  private void getDirectionY()
  {
    float direction = random(-1, 1);
    float y;
    if(direction < 0)
    {
      
      directionY = -1;
      moveY = (int) ((ypos - random(0, ypos)) / planeSpeed);;
    }
    else
    {
      directionY = 1;
      moveY = (int) ((random(ypos, height / 4) - ypos) / planeSpeed);
    }
  }
  
  public void move() {
    int r;
    if(moveX < 0)
    {
      getDirectionX();
    }
    if(moveY < 0)
    {
      getDirectionY();
    }
    xpos += directionX * planeSpeed;
    ypos += directionY * planeSpeed;
    moveX--;
    moveY--;
  }

  void shoot() {
    if (getLive() > 0) {    
      if (nextShoot == 0) {
        nextShoot = shootRate;
        Bullet b = new Bullet(xpos, ypos + getHeight()/2, 1);
        b.setLifeTime((int)height);
        enemyComponents.addChild(b);
      }
      nextShoot -= 1;
    }
  }

  public void attach(IBossObserver newObserver) {
    bossObservers.add(newObserver);
  }
  
  public void notifyBossObserver(boolean isThereBoss) {
    for(IBossObserver observer: bossObservers)
    {
      observer.updateBossObserver(isThereBoss);
    }
  }

  public void attachBossObserver(IBossObserver observer) {
   bossObservers.add(observer); 
  }
  
}
