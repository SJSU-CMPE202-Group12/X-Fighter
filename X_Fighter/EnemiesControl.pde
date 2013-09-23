import java.util.*;

class EnemiesControl
{
  private int maxY; // max y coordinate that the plane can go
  private Set<EnemyPlane> enemies;
  
  public EnemiesControl(int rangeY)
  {
    enemies = new HashSet<EnemyPlane>();
    maxY = rangeY;
  }
  
  public void add(EnemyPlane enemy)
  {
    enemies.add(enemy);
  }
  
  public void remove(EnemyPlane enemy)
  {
    enemies.remove(enemy);
  }
  
  public void move()
  {
    EnemyPlane removePlane = null;
    for(EnemyPlane e : enemies)
    {
      e.display();
      e.move();
      if(e.getY() - e.getHeight() / 2 > maxY)
      {
        removePlane = e;
      }
    }
    if(removePlane != null)
    {
      this.remove(removePlane);
    }
  }
}
