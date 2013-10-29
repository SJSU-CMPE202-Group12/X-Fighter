class Enemy extends Collide implements Component
{
  private float xpos; // x coordinate of center of plane 
  private float ypos; // y coordinate of center of plane
  private float planeSpeed; // speed of plane (coordinate/frame)
  private int live;
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
    } else {
    //check collide with fighter
      for(Component c : fighter.components){
        Collide obj = (Collide) c;
        if(this.collision(obj))
        {
          obj.destroy();
          this.destroy();
          
          float x= getX()-getWidth()/4;
          float y= getY()-getHeight()/2;
          gameComponents.addChild(new Explosion(x,y));   
        }
      }
    }
  }
}
