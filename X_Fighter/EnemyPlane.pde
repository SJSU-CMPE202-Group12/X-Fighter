import java.util.Random;

class EnemyPlane
{
  private int x; // x coordinate of front of plane 
  private int y; // y coordinate of front of plane
  private int maxX; // max x coordinate that the plane can appear
  private int size; // distance from midle of plane to end of "wing"
  private int planeHeight; //heigh of plane
  private int planeSpeed; // speed of plane
  
  /*
  * 
  */
  public EnemyPlane(int rangeX, int speed)
  {
    size = 10;
    planeHeight = 2 * size;
    y = planeHeight;
    planeSpeed = speed;
    maxX = rangeX;
    Random r = new Random();
    x = r.nextInt(maxX - size - 1) + size; 
  }
  
  /*
  * return the x coordinate of center of plane
  */
  public int getX()
  {
    return x;
  }

  /*
  * return the y coordinate of center of plane
  */  
  public int getY()
  {
    return y + planeHeight / 2;
  }
  
  /*
  * return width of plane
  */
  public int getWidth()
  {
    return 2 * size;
  }
  
  /*
  * return height of plane
  */
  public int getHeight()
  {
    return planeHeight;
  }
  
  public void display()
  {
    noStroke();
    fill(100);
    triangle(x, y, x - size, y - planeHeight, x + size, y - planeHeight);
  }
  
  public void move()
  {
    y += planeSpeed;
    display();
  }
}
