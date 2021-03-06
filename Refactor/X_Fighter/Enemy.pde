abstract class Enemy extends Collide implements IComponent
{
  
  
  protected float xpos; // x coordinate of center of plane 
  protected float ypos; // y coordinate of center of plane
  protected float planeSpeed; // speed of plane (coordinate/frame)
  int live;
  boolean shoot = false; //does this enemy plane shoot?
  protected int shootRate = 30; //shoot one bullet every 30 frames
  int nextShoot = 0;  //when to shoot the next bullet
  GameComponents enemyComponents;
  
  PImage enemyImg;
 
  public Enemy(float speed)
  {    
    enemyImg = loadImage("EnemyPlaneImage.png");
    enemyImg.resize(50, 40);
    //live = 1;   //enemy plane has only one life.
    planeSpeed = speed;
    xpos = random(width - getWidth()) + getWidth()/2;     
    ypos = -getHeight()/2;
  }
  
  public void setLive(int live){
    this.live = live;
  }
  
  public int getLive(){
    return live;
  }
  
  /*
  * return the x coordinate of center of plane
  */
  public float getX()
  {
    return xpos;
  }

  /*
  * return the y coordinate of center of plane
  */  
  public float getY()
  {
    return ypos;
  }
  
  /*
  * return width of plane
  */
  public float getWidth()
  {
    return enemyImg.width;
  }
  
  /*
  * return height of plane
  */
  public float getHeight()
  {
    return enemyImg.height;
  }
  
  void addChild(IComponent c){
    // no implementation
  }
  
  void removeChild(IComponent c){
    // no implementation
  }
  
  public int getLife()
  {
    return live;
  }
  
  public boolean destroy()
  {
    live -= 1;
    return true;
  }
  
  public void increaseScore(Score s) {
    s.increaseScore(1);
  }
  
  public void display()
  {
    move();
    //shoot();
    imageMode(CENTER);  
    if (live > 0) 
      image(enemyImg, xpos, ypos); 
  }
  
  public void move()
  {
    ypos += planeSpeed;
    //if the enemy plane move out of the screen, set live to zero
    if(getY() - getHeight() / 2 > height){
      live = 0;
    } 
  }
  
  void  setShoot(GameComponents gc) {  
  }
  
  
}
