class Enemy extends Collide implements Component
{
  private float xpos; // x coordinate of center of plane 
  private float ypos; // y coordinate of center of plane
  private float planeSpeed; // speed of plane (coordinate/frame)
  private int live;
  private boolean shoot = false; //does this enemy plane shoot?
  private int shootRate = 30; //shoot one bullet every 30 frames
  private int nextShoot = 0;  //when to shoot the next bullet
  private GameComponents enemyComponents;
  PImage enemyImg;
 
  public Enemy(float speed)
  {    
    enemyImg = loadImage("EnemyPlaneImage.png");
    enemyImg.resize(50, 40);
    live = 1;   //enemy plane has only one life.
    planeSpeed = speed;
    xpos = random(width - getWidth()) + getWidth()/2;     
    ypos = -getHeight()/2;
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
  
  void addChild(Component c){
    // no implementation
  }
  
  void removeChild(Component c){
    // no implementation
  }
  
  public int getLife()
  {
    return live;
  }
  
  public void destroy()
  {
    live -= 1;
    Score.COUNTER ++;
  }
  
  public void display()
  {
    move();
    shoot();
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
  
  void setShoot(GameComponents gc) {
    shoot = true;
    enemyComponents = gc;
  }
  
  void shoot() {
    if (shoot && live > 0) {    
      if (nextShoot == 0) {
        nextShoot = shootRate;
        Bullet b = new Bullet(xpos, ypos + getHeight()/2, 1);
        enemyComponents.addChild(b);
      }
      nextShoot -= 1;
    }
  }
}
