class EnemyPlaneLevel2 extends Enemy{  //Enemyplane has 2 lives and should be shooted with 2 bullets
  
   public EnemyPlaneLevel2(float speed)
  {     
    super(speed);
    setLive(2);   //enemy plane has only one life. 
  } 
  
   public boolean destroy()
  {
    live -= 1;
   
     if(live==0){
       return true;
     }
     else
     return false; 
  }

}
