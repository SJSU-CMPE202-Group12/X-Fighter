import java.util.Random;

class EnemyPlane
{
  private int x; // x coordinate of front of plane 
  private int y; // y coordinate of front of plane
  private int size; // plane width / 2
  private int maxX; // max x coordinate that the plane can go
  private int maxY; // max y coordinate that the plane can go
  private int speed;
  
  public EnemyPlane(int rangeX, int rangeY, int speed)
  {
    size = 10;
    y = 2 * size;
    maxX = rangeX;
    maxY = rangeY;
    Random r = new Random();
    x = r.nextInt(maxX - size - 1) + size; 
    this.speed = speed;
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
    return y + size;
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
    return 2 * size;
  }
  
  public void display()
  {
    noStroke();
    fill(100);
    triangle(x, y, x - size, y - 2 * size, x + size, y - 2 * size);
  }
  
  public void move()
  {
    y += speed;
    display();
  }
}
