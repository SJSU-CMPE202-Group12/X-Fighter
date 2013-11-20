class Level implements Subject, IBossObserver
{
  private int level = 1; //game starts at level 1
  private int pointsToNextLevel = 10;
  private int nextLevelPoints = pointsToNextLevel;
  private float minSpeed = 1; //minimum speed of plane is 1
  private float maxSpeed = 1; //maximu speed when game starts is 1
  private Random random;
  private ArrayList <ILevelObserver> observers = new ArrayList();
  private float delta = 0.01;
  private AudioPlayer player2;
  private boolean onHold = false;

  private float ratioIncreasePerLevel = 0.95; //how much the ratio increases from one level to another in percentage (should be < 1)
  private float speedIncreasePerLevel = 1.2; //how much the speed increases from one level to another in percentage (should be > 1)
  private int ratio = 100; //game starts with ratio 100, its values means how many frames untill next plane appears
  
  public Level()
  {
    player2 = minim.loadFile("beep-1.mp3");

    random = new Random();
  }
 
  public int getLevel(){
    return level;
  }
  
  public float getSpeed()
  {
    return random(minSpeed, maxSpeed + delta);
  }
  
  public int getRatio()
  {
    return ratio;
  }
  
  public int getNextLevelPoints()
  {
    return nextLevelPoints;
  }
  
  public void notifyObserver(){
    for(ILevelObserver obj : observers)
      obj.updateObservers();
  }
  
  public void detach(ILevelObserver obj){
    observers.remove(obj);
  }
  
    public void attach(ILevelObserver obj){
  observers.add(obj);
  
  }
  
  public void levelUp() {
      ++level;
            player2.play();
      ratio *= ratioIncreasePerLevel;
      maxSpeed *= speedIncreasePerLevel;
  }
  
  public void act(int score)
  {
    if(score >= nextLevelPoints)
    {
      nextLevelPoints += pointsToNextLevel;
      notifyObserver();
    }
  }
  
  public void updateBossObserver() {
    if(onHold)
    {
      levelUp();
    }
    onHold = !onHold;
  }
   
}

