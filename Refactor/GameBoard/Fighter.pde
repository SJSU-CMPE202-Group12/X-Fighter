// class for my plane

class Fighter {
  int xpos;  //x coordinate of center of my plane
  int ypos;  // y coordinate of center of my plane
  int speed = 2; // move 2 pixels per frame if the arrow key is pressed
  int shootRate = 15; // shoot one bullet every 15 frames
  int nextShoot = 0;  // when to shoot the next bullet
  int size = 25;
  int planeHeight = 2 * size;
  ArrayList<Bullet> bullets;
  PImage myPlaneImg;
  boolean upPressed = false;
  boolean downPressed = false;
  boolean leftPressed = false;
  boolean rightPressed = false;
 // FighterControl fighterControl;




  Fighter(int x, int y) {
    bullets = new ArrayList<Bullet>();
    myPlaneImg = loadImage("myplane.png");
    myPlaneImg.resize(getWidth(), getHeight()); 
    xpos = x;
    ypos = y - getHeight()/2;
       
  }
  
  int getX(){
    return xpos;
  }
  
  int getY(){
    return ypos;
  }
  
  int getWidth(){
    return 2 * size;
  }
  
  int getHeight(){
    return planeHeight;
  }
  
  void shoot() {    
    if (nextShoot == 0) {
      nextShoot = shootRate;
      bullets.add(new Bullet(xpos, ypos - getHeight()/2));
    }
    nextShoot -= 1;
  }

  // remove the bullet that run out of lifetime and display others
  void updateBullet()
  {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);
      if (b.lifetime == 0)
        bullets.remove(i);
      else
        b.display();
    }
  }

//  //plane is controled by arrow keys;
//  void move(){
//  fighterControl = new FighterControl(this);
//  fighterControl.move();
//  }
  
//    void move(){
//      if (leftPressed && (this.xpos - getWidth()/2 - this.speed) > 0){ 
//          this.xpos -= this.speed;
//          text("left!",10,100);
//      }
//
//       if (rightPressed && (this.xpos + getWidth()/2 + this.speed) < width) 
//          this.xpos += this.speed;
//
//       if (upPressed && (this.ypos - getHeight()/2 - this.speed) > 0) 
//          this.ypos -= this.speed;
//
//       if (downPressed && (this.ypos + getHeight()/2 + this.speed) < height) 
//          this.ypos += this.speed;
//     }

 void move() {
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
  }
  

  
    void keyPressed() {      
    
      if (key == CODED) {
       
        if (keyCode == LEFT) {
          leftPressed = true;          
        }

        if (keyCode == RIGHT ) 
          rightPressed = true;         
  
        if (keyCode == UP ) 
          upPressed = true;        
  
        if (keyCode == DOWN) 
          downPressed = true;           
      }   
  } 
    void keyReleased(){
      if (key == CODED) {
        if (keyCode == UP) 
          upPressed = false;
        
        if (keyCode == DOWN) 
          downPressed = false;
        
         if (keyCode == LEFT) 
          leftPressed = false;
        
        if (keyCode == RIGHT) 
          rightPressed = false;
      }
    
  }
  
  
  
 

    
  void display() {  
    imageMode(CENTER);  
    image(myPlaneImg, xpos, ypos); 
    //move();
   // text("left!",10,100);
    
    updateBullet();
  }
}

