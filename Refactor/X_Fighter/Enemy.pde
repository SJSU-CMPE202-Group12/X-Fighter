class Enemy extends Collide
{
  private float xpos; // x coordinate of center of plane 
  private float ypos; // y coordinate of center of plane
  private float maxX; // max x coordinate that the plane can appear
  private float planeSpeed; // speed of plane (coordinate/frame)
  PImage enemyImg;
  
  /*
  * rangeX is the max x coordinate that the plane can appear
  */
  public Enemy(float rangeX, float speed)
  {
    enemyImg = loadImage("EnemyPlaneImage.png");
    enemyImg.resize(50, 40);
    planeSpeed = speed;
    maxX = rangeX;
    xpos = random(maxX - getWidth()) + getWidth()/2;     
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
  
  public void display()
  {
    imageMode(CENTER);  
    image(enemyImg, xpos, ypos); 
  }
  
  public void move()
  {
    ypos += planeSpeed;
    display();
  }
}
