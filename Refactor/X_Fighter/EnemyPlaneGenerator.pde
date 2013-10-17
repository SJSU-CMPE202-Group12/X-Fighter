class EnemyGenerator
{
  private int ratio; // how many frames untill next plane appears
  private int lastPlane; // how many frames ago did the last plane appeared
  private int maxX; // max x coordinate that the plane can appear
  private int maxY; // max y coordinate that the plane can go
  private int planeSpeed; // speed that the planes generated will move
  private EnemyControl control;
  
  /*
  * rangeX is the max x coordinate that the plane can appear
  * rangeY is the max y coordinate that the plane can appear
  */
  public EnemyGenerator(int rangeX, int rangeY)
  {
    ratio = 100;
    maxX = rangeX;
    planeSpeed = 1;
    lastPlane = ratio;
    control = new EnemyControl(rangeY);
  }
  
  public void setPlaneSpeed(int speed)
  {
    planeSpeed = speed;
  }
  
  /*
  * set how many frames until next plane appears
  */
  public void setRatio(int ratio)
  {
    this.ratio = ratio;
  }
  
  private void addEnemyPlane()
  {
    Enemy enemy = new Enemy(maxX, planeSpeed);
    control.add(enemy);
    lastPlane = 0;
  }
  
  private void generateEnemyPlane()
  {
    lastPlane++;
    if(lastPlane >= ratio)
   {
     addEnemyPlane();
   } 
  }
  
  public void display(Fighter fighter)
  {
    generateEnemyPlane();
    control.move(fighter);
  }
}
