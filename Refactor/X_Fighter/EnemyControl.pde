import java.util.*;

class EnemyControl
{
  private int maxY; // max y coordinate that the plane can go
  
  private Set<Enemy> enemies; // keeps all the planes it will control
  
  /*
  * rangeY is the max coordinate that the plane should appear
  */
  public EnemyControl(int rangeY)
  {
    enemies = new HashSet<Enemy>();
    maxY = rangeY; 
  }
  
  public void add(Enemy enemy)
  {
    enemies.add(enemy);
  }
  
  public void remove(Enemy enemy)
  {
    enemies.remove(enemy);
  }
  
  public void move(Fighter fighter)
  {
    // may remove multiplane at a time
    Set<Enemy> removePlanes = new HashSet<Enemy>();
    
    for(Enemy e : enemies)
    {
      // check collision between the bullets and enemy plane
      for(Bullet b : fighter.bullets)
      {
        if(b.collision(e))
        {
          b.lifetime = 0;
          
          float x= e.getX()-e.getWidth()/4;
          float y= e.getY()-e.getHeight()/2;
          fighter.explosions.add(new Explosion(x,y));   
          
          removePlanes.add(e);
          Score.COUNTER ++;
        }
      }
      
      // check collision between the enemy plane and my plane
      if(fighter.collision(e)) {
        fighter.live -= 1;
        float x= e.getX()-e.getWidth()/4;
        float y= e.getY()-e.getHeight()/2;
        fighter.explosions.add(new Explosion(x,y)); 
        removePlanes.add(e);
      }
      
      e.display();
      e.move();
      if(e.getY() - e.getHeight() / 2 > maxY)
      {
        removePlanes.add(e);
      }
    }
    
    // remove enemy planes that touch the bottom or collide with a bullet
    for(Enemy e : removePlanes)
    {      
      this.remove(e);
    }
  }
}
