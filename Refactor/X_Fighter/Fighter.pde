class Fighter extends Collide implements Component {
  private float xpos;    //x coordinate of center of my plane
  private float ypos;    //y coordinate of center of my plane
  private int speed;
  private int live = 3;  //live left of my plane
  private int disappear = 0; 
  private int shootRate = 15; //shoot one bullet every 15 frames
  private int nextShoot = 0;  //when to shoot the next bullet
  private GameComponents fighterComponents;
  private PImage myPlaneImg;
  private IShootStrategy shooter;
  private Blink blink;

  Fighter(int x, int y, GameComponents gc) {
    myPlaneImg = loadImage("myplane.png");
    myPlaneImg.resize(50, 50); 
    xpos = x;
    ypos = y - getHeight()/2;   
    fighterComponents = gc;    
    shooter = new DefaultShooter(gc, this, -1);
    //shooter = new MultipleBulletsShooter(gc, this, -1);
  }

  float getX() {
    return xpos;
  }

  float getY() {
    return ypos;
  }

  float getWidth() {
    return myPlaneImg.width;
  }

  float getHeight() {
    return myPlaneImg.height;
  }

  void addChild(Component c) {
    // no implementation
  }
  void removeChild(Component c) {
    // no implementation
  }

  int getLife() {
    return live;
  }

  boolean destroy() {
    // the my plane is disappeared from the screen then it won't be destroyed
    if (visible()) {
      live -= 1;
      resetDisappear();
      setDefaultShooter();
      return true;
    }
    return false;
  }

  void resetDisappear()
  {
    disappear = 330; //if my plane is hit by enemy, it will disappear for 30 frames
    blink = new Blink(300, true);
  }


  //plane is controled by arrow keys;

  void move() {
    this.speed = fighterControl.getSpeed();
    if (fighterControl.getLeftKey() && (this.xpos - getWidth()/2 - this.speed) > 0)
      this.xpos -= this.speed;  
    if (fighterControl.getRightKey() && (this.xpos + getWidth()/2 + this.speed) < width)
      this.xpos += this.speed;
    if (fighterControl.getUpKey() && (this.ypos - getHeight()/2 - this.speed) > 0)
      this.ypos -= this.speed;
    if (fighterControl.getDownKey() && (this.ypos + getHeight()/2 + this.speed) < height)
      this.ypos += this.speed;
  }

  void shoot() {
    if (live > 0) {    
      if (nextShoot == 0) {
        nextShoot = shootRate;
        shooter.shoot();
      }
      nextShoot -= 1;
    }
  }

  boolean visible() {
    return disappear <= 0;
  }

  void display() {
    // When myplane reappear, it is still invisible to enemy for a while and blinks.
    if (disappear <= 300 && live > 0) {
      if (disappear > 0) {
        if (blink.display(disappear)) {
          move(); 
          imageMode(CENTER);  
          image(myPlaneImg, xpos, ypos);
        }
        disappear--;
      }
      else
      {
        move();  
        shoot();
        imageMode(CENTER);  
        image(myPlaneImg, xpos, ypos);
      }
    }
    else
      disappear--;
  }

  public void increaseLife(int life) {
    live += life;
  }

  public void setShooter(IShootStrategy shooter) {
    if (this.shooter.getClass() == shooter.getClass() && shooter instanceof TimedShooter)
    {
      ((TimedShooter) this.shooter).increaseTime();
    }
    else
    {
      this.shooter = shooter;
    }
  }

  public void setDefaultShooter() {
    setShooter(new DefaultShooter(fighterComponents, this, -1));
  }

  public IShootStrategy getShooter() {
    return shooter;
  }

  public int getShooterTimeLeft() {
    if (shooter instanceof TimedShooter)
    {
      return ((TimedShooter) shooter).getTimeLeft() / 100;
    }
    return 0;
  }

  public void pause() {
    if (shooter instanceof TimedShooter)
    {
      ((TimedShooter) shooter).pause();
    }
  }

  public void resume() {
    if (shooter instanceof TimedShooter)
    {
      ((TimedShooter) shooter).resume();
    }
  }
}

