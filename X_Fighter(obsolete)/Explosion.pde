import gifAnimation.*;

class Explosion  {
  int playerWidth = 50;
  int playerHeight = 50;
  int xpos ;
  int ypos ;
  int lifetime=40;

  Explosion(int x, int y){
  xpos = x;
  ypos = y;
  } 

  void display(){
     // image(myAnimation, xpos,ypos,playerWidth,playerHeight);
      lifetime -= 1;
      if (lifetime > 0){
          myAnimation.play();
          image(myAnimation, xpos,ypos,playerWidth,playerHeight);
      }
      else
          myAnimation.stop();
  }  
   
   
}

  
  
  
  
  

