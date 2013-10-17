import gifAnimation.*;

class Explosion  {
  int playerWidth = 50;
  int playerHeight = 50;
  int xpos ;
  int ypos ;
  int lifetime=45;
  Gif myAnimation;

  Explosion(int x, int y){
    xpos = x;
    ypos = y;
    myAnimation = new Gif(X_Fighter.xFighter, "Explosion.gif");
    myAnimation.noLoop();
  } 
  
  void display(){
      lifetime -= 1;
      if (lifetime > 0){
        myAnimation.play();
        image(myAnimation, xpos,ypos,playerWidth,playerHeight);
     }
  }    
}

  
  
  
  
  

