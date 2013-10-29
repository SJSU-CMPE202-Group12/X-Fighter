// class for my plane and its bullets

class Fighter {
  private int shootRate = 15; //shoot one bullet every 15 frames
  private int nextShoot = 0;  //when to shoot the next bullet
  private GameComponents fighterComponents;
  private MyPlane myPlane;

  Fighter(int x, int y, GameComponents gc) {
    myPlane = new MyPlane(x, y);
    fighterComponents = gc;
    fighterComponents.addChild(myPlane);
  }
  
  void shoot() {
    if (myPlane.getLife() > 0) {    
      if (nextShoot == 0) {
        nextShoot = shootRate;
        Bullet b = new Bullet(myPlane.getX(), myPlane.getY() - myPlane.getHeight()/2);
        fighterComponents.addChild(b);
      }
      nextShoot -= 1;
    }
  }
  
  int getLife(){
    return myPlane.getLife();
  }
}

