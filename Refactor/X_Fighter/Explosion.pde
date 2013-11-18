import gifAnimation.*;

class Explosion implements Component {
  int playerWidth = 50;
  int playerHeight = 50;
  float xpos ;
  float ypos ;
  int lifetime=45;
  Gif myAnimation;

  Explosion(float x, float y){
    xpos = x;
    ypos = y;
    myAnimation = new Gif(xFighter, "Explosion.gif");
    myAnimation.noLoop();
    
  } 
  
  void addChild(Component c){
    // no implementation
  }
  void removeChild(Component c){
    // no implementation
  }
  
  int getLife(){
    return lifetime;
  }
  
  void destroy(){
    lifetime = 0;
  }
  
  void display(){
      lifetime -= 1;
      if (lifetime > 0){
        myAnimation.play();
        image(myAnimation, xpos,ypos,playerWidth,playerHeight);
     }
  }    
}

  
  
  
  
  

