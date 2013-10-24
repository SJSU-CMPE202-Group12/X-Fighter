class FighterControl{
 
  boolean upPressed = false;
  boolean downPressed = false;
  boolean leftPressed = false;
  boolean rightPressed = false;
  int speed=2;

  
 FighterControl(){ 

 }
 
 void setSpeed(int a){
   speed = a;
 }
 int getSpeed(){
   return speed;
 }
 

 
 void setLeftKey(){
   leftPressed = true;
 }
 
 void setRightKey(){
   rightPressed = true;
 }
  
 void setUpKey(){
   upPressed = true;
 }

 void setDownKey(){
   downPressed = true;
 }
 
 boolean  getLeftKey(){
   return leftPressed;
 }
 
 boolean getRightKey(){
   return rightPressed;
 }
  
 boolean getUpKey(){
   return upPressed;
 }

 boolean getDownKey(){
   return downPressed;
 } 
 
 void releaseLeftKey(){
   leftPressed = false;
 }
 
 void releaseRightKey(){
   rightPressed = false;
 }
  
 void releaseUpKey(){
   upPressed = false;
 }

 void releaseDownKey(){
   downPressed = false;
 } 
} 
  

      
  
  


