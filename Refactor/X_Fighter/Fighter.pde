// class for my plane and its bullets

class Fighter {
  private int shootRate = 15; //shoot one bullet every 15 frames
  private int nextShoot = 0;  //when to shoot the next bullet
  public ArrayList<Component> components;
  private MyPlane myPlane;

  Fighter(int x, int y) {
    myPlane = new MyPlane(x, y);
    components = new ArrayList<Component>();
    components.add(myPlane);
    gameComponents.addChild(myPlane);
  }
  
  void shoot() {
    if (myPlane.getLife() > 0) {    
      if (nextShoot == 0) {
        nextShoot = shootRate;
        Bullet b = new Bullet(myPlane.getX(), myPlane.getY() - myPlane.getHeight()/2);
        components.add(b);
        gameComponents.addChild(b);
      }
      nextShoot -= 1;
    }
    // remove the component that run out of lifetime
    for (int i = components.size() - 1; i >= 0; i--) {
      Component c = components.get(i);
      if (c.getLife() <= 0)
        components.remove(c);
    }
  }
  
  int getLife(){
    return myPlane.getLife();
  }
}

