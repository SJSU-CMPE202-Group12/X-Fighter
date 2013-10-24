// class for my plane

class Fighter extends Collide {
  float xpos;    //x coordinate of center of my plane
  float ypos;    //y coordinate of center of my plane
  //int speed = 2; //move 2 pixels per frame if the arrow key is pressed
  int speed;
  int shootRate = 15; //shoot one bullet every 15 frames
  int nextShoot = 0;  //when to shoot the next bullet
  int live = 1;  //live left of my plane
  ArrayList<Bullet> bullets;
  ArrayList<Explosion> explosions;
  PImage myPlaneImg;

  Fighter(int x, int y) {
    bullets = new ArrayList<Bullet>();
    explosions =new ArrayList<Explosion>();
    
    myPlaneImg = loadImage("myplane.png");
    myPlaneImg.resize(50, 50); 
    xpos = x;
    ypos = y - getHeight()/2;       
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
  
  void shoot() {
    if (live > 0) {    
      if (nextShoot == 0) {
        nextShoot = shootRate;
        bullets.add(new Bullet(xpos, ypos - getHeight()/2));
      }
      nextShoot -= 1;
    }
  }

  // remove the bullet that run out of lifetime and display others
  void updateBullet() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      if (b.lifetime == 0)
        bullets.remove(i);
      else
        b.display();
    }
  }
  
  void updateExplosion() {
    for (int i = explosions.size() - 1; i >= 0; i--) {
      Explosion e = explosions.get(i);
      if (e.lifetime == 0)
        explosions.remove(i);
      else
        e.display();
    }
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
    
  void display() {  
    imageMode(CENTER);  
    if(live > 0)
      image(myPlaneImg, xpos, ypos); 
    updateBullet();
    updateExplosion(); 
  }
}

