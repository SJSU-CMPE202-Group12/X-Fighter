import gifAnimation.*;




class Explosion  {
  
  
  int time=60; // stay on the screen for 60 frames, i.e. 1 second
  PImage explosionImg;
  int playerWidth = 50;
  int playerHeight = 50;
   int xpos ;
  int ypos ;
  int lifetime=40;
 // Gif myAnimation = new Gif(this, "explosion.gif");
  //Gif myAnimation;
  //myAnimation=Animation;



  
  Explosion(int x, int y){
  xpos = x;
  ypos = y;
  //display();
  
      //myAnimation.play();
     // image(myAnimation, xpos,ypos,playerWidth,playerHeight);
      //myAnimation.play();
      //myAnimation.loop();
      
    
   
  } 

  void display(){
     // image(myAnimation, xpos,ypos,playerWidth,playerHeight);
      lifetime -= 1;
      if (lifetime > 0){
      //lifetime -= 1;
      myAnimation.play();
      image(myAnimation, xpos,ypos,playerWidth,playerHeight);
      //myAnimation.loop();
      //myAnimation.stop();
      //myAnimation.noLoop();
     }
     else
     myAnimation.stop();
  }  
   
   
}

  
  
  
  
  

