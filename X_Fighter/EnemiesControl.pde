import java.util.*;

class EnemiesControl
{
  private int maxY; // max y coordinate that the plane can go
  
  private Set<EnemyPlane> enemies; // keeps all the planes it will control
  
  //ArrayList<Explosion> explosions;
  int timer = 60;
  int x;
  int y;
  
  /*
  * rangeY is the max coordinate that the plane should appear
  */
  public EnemiesControl(int rangeY)
  {
    enemies = new HashSet<EnemyPlane>();
    explosions =new ArrayList<Explosion>();
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
    // may remove multiplane at a time
    Set<EnemyPlane> removePlanes = new HashSet<EnemyPlane>();
    
    for(EnemyPlane e : enemies)
    {
      // detect collision between the bullets and enemy plane
      for(Bullet b : plane.bullets)
      {
        if(b.collideWithEnemy(e))
        {
          b.lifetime = 0;
          collision.add(true );
          x= e.getX()-e.getWidth()/4;
          y= e.getY()-e.getHeight()/2;
          explosions.add(new Explosion(x,y));
          
          removePlanes.add(e);
          //explosions.add(new Explosion(e.getX()-e.getWidth()/4, e.getY()-e.getHeight()/2));          
          Score.counter++;
        }
      }
      
      e.display();
      e.move();
      if(e.getY() - e.getHeight() / 2 > maxY)
      {
        removePlanes.add(e);
      }
    }
    
    // remove enemy planes that touch the bottom or collide with a bullet
    for(EnemyPlane e : removePlanes)
    {      
      this.remove(e);
    }
  }
}
