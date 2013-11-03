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

  Fighter(int x, int y, GameComponents gc) {
    myPlaneImg = loadImage("myplane.png");
    myPlaneImg.resize(50, 50); 
    xpos = x;
    ypos = y - getHeight()/2;   
    fighterComponents = gc;    
  }
  
  float getX(){
    return xpos;
  }
  
  float getY(){
    return ypos;
  }
  
  float getWidth(){
    return myPlaneImg.width;
  }
  
  float getHeight(){
    return myPlaneImg.height;
  }
  
  void addChild(Component c){
    // no implementation
  }
  void removeChild(Component c){
    // no implementation
  }
  
  int getLife(){
    return live;
  }
  
  void destroy(){
    // the my plane is disappeared from the screen then it won't be destroyed
    if (visible()) {
      live -= 1;
      resetDisappear();
    }
  }
  
  void resetDisappear()
  {
    disappear = 30; //if my plane is hit by enemy, it will disappear for 30 frames
  }
   //plane is controled by arrow keys;
  
 /* void move() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT && (this.xpos - getWidth()/2 - this.speed) > 0) 
          this.xpos -= this.speed;

        if (keyCode == RIGHT && (this.xpos + getWidth()/2 + this.speed) < width) 
          this.xpos += this.speed;

        if (keyCode == UP && (this.ypos - getHeight()/2 - this.speed) > 0) 
          this.ypos -= this.speed;

        if (keyCode == DOWN && (this.ypos + getHeight()/2 + this.speed) < height) 
          this.ypos += this.speed;
      }
    }
  }*/
  
  void move(){
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
        Bullet b = new Bullet(xpos, ypos - getHeight()/2, -1);
        fighterComponents.addChild(b);
      }
      nextShoot -= 1;
    }
  }
  
  boolean visible() {
    return disappear <= 0;
  }
  
  void display() {
    if (disappear <= 0 && live > 0){
      move();  
      shoot();
      imageMode(CENTER);  
      image(myPlaneImg, xpos, ypos);
    }
    else
      disappear--;
  }
}

