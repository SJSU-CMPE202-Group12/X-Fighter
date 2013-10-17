import java.util.Random;

class Enemy extends Collide
{
  private int xpos; // x coordinate of center of plane 
  private int ypos; // y coordinate of center of plane
  private int maxX; // max x coordinate that the plane can appear
  private int planeSpeed; // speed of plane
  PImage enemyImg;
  
  /*
  * rangeX is the max x coordinate that the plane can appear
  */
  public Enemy(int rangeX, int speed)
  {
    enemyImg = loadImage("EnemyPlaneImage.png");
    enemyImg.resize(50, 40);
    planeSpeed = speed;
    maxX = rangeX;
    Random r = new Random();
    xpos = r.nextInt(maxX - getWidth()) + getWidth()/2;     
    ypos = -getHeight()/2;
  }
  
  /*
  * return the x coordinate of center of plane
  */
  public int getX()
  {
    return xpos;
  }

  /*
  * return the y coordinate of center of plane
  */  
  public int getY()
  {
    return ypos;
  }
  
  /*
  * return width of plane
  */
  public int getWidth()
  {
    return enemyImg.width;
  }
  
  /*
  * return height of plane
  */
  public int getHeight()
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
