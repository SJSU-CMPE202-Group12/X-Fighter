// class for my plane

class MyPlane {
  int xpos;  //x coordinate of center of my plane
  int ypos;  // y coordinate of center of my plane
  int speed = 2; // move 2 pixels per frame if the arrow key is pressed
  int shootRate = 15; // shoot one bullet every 15 frames
  int nextShoot = 0;  // when to shoot the next bullet
  int size = 25;
  int planeHeight = 2 * size;
  ArrayList<Bullet> bullets;
  PImage myPlaneImg;

  MyPlane(int x, int y) {
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

  //plane is controled by arrow keys;
  void move()
  {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT && (plane.xpos - getWidth()/2 - plane.speed) > 0) 
          plane.xpos -= plane.speed;

        if (keyCode == RIGHT && (plane.xpos + getWidth()/2 + plane.speed) < width) 
          plane.xpos += plane.speed;

        if (keyCode == UP && (plane.ypos - getHeight()/2 - plane.speed) > 0) 
          plane.ypos -= plane.speed;

        if (keyCode == DOWN && (plane.ypos + getHeight()/2 + plane.speed) < height) 
          plane.ypos += plane.speed;
      }
    }
  }
    
  void display() {  
    imageMode(CENTER);  
    image(myPlaneImg, xpos, ypos); 
    updateBullet();
  }
}

