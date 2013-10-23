//class FighterControl{
// int  x;
// int  y;
//  boolean upPressed = false;
//  boolean downPressed = false;
//  boolean leftPressed = false;
//  boolean rightPressed = false;
//  int planeWidth;
//  int planeHeight;
//  int speed;
//  
// FighterControl(Fighter fighter){
//   x=fighter.xpos;
//   y=fighter.ypos;
//   planeWidth= fighter.getWidth();
//   planeHeight = fighter.getHeight();
//   speed= fighter.speed;
// }
//  
//  
//  
//  
//  
//  void keyPressed() {      
//      if (key == CODED) {
//        if (keyCode == LEFT){ 
//          leftPressed = true;
//        }
//     
//          //this.xpos -= this.speed;
//
//        if (keyCode == RIGHT ) 
//          rightPressed = true;
//         //this.xpos += this.speed;
//  
//        if (keyCode == UP ) 
//          upPressed = true;
//        //this.ypos -= this.speed;
//       
//  
//        if (keyCode == DOWN) 
//          downPressed = true;
//          //this.ypos += this.speed;
//         
//      }
//    
//  } 
//    void keyReleased(){
//      if (key == CODED) {
//        if (keyCode == UP) {
//          upPressed = false;
//        }
//        else if (keyCode == DOWN) {
//          downPressed = false;
//        }
//        else if (keyCode == LEFT) {
//          leftPressed = false;
//        }
//        else if (keyCode == RIGHT) {
//          rightPressed = false;
//      }
//    }
//  }
  

//  void move(){
//
//    if (keyPressed) {
//      if (key == CODED) {
//        if (keyCode == LEFT && (x - planeWidth- speed) > 0){ 
//           x-=speed;
//           ellipse(x, y, 30, 30);}
//
//        if (keyCode == RIGHT && (x + planeWidth/2 + speed) < width) 
//          x += speed; 
//
//        if (keyCode == UP && (y - planeHeight/2 - speed) > 0) 
//          y -= speed;
//
//        if (keyCode == DOWN && (y + planeHeight/2 + speed) < height) 
//          y += speed;
//      }
//    }
  

//    if(leftPressed && (x - planeWidth- speed) > 0) 
//      x-=speed;
//    else if(rightPressed && (x + planeWidth/2 + speed) < width)
//      x += speed;  
//     
//    if (upPressed && (y - planeHeight/2 - speed) > 0)
//      y -= speed;
//    else if (downPressed &&(y + planeHeight/2 + speed) < height)
//      y += speed;
//      ellipse(x, y, 30, 30);

      
  
  


