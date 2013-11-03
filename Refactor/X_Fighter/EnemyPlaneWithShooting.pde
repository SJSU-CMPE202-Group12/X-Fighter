class EnemyPlaneWithShooting extends Enemy{
  
   public EnemyPlaneWithShooting(float speed){      
    super(speed);
    setLive(1);  
  }
  
   void setShoot(GameComponents gc) {
    shoot = true;
    enemyComponents = gc;
  }
  
  void shoot() {
    if (shoot && getLive() > 0) {    
      if (nextShoot == 0) {
        nextShoot = shootRate;
        Bullet b = new Bullet(xpos, ypos + getHeight()/2, 1);
        enemyComponents.addChild(b);
      }
      nextShoot -= 1;
    }
  }
    public void display()
  {
    move();
    shoot();
    imageMode(CENTER);  
    if (getLive() > 0) 
    image(enemyImg, xpos, ypos); 
  }
  

}
