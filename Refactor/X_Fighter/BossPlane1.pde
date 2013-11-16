public class BossPlane1 extends EnemyPlaneLevel2{

  private EnemyGenerator enemyGenerator;
  
  public BossPlane1(float speed, EnemyGenerator enemyGenerator)
  {     
    super(speed);
    this.enemyGenerator = enemyGenerator;
    enemyImg = loadImage("images.jpeg");
    enemyImg.resize(50, 40);
    setLive(3);   //enemy plane has three life. 
  } 

   public boolean destroy()
  {
    live -= 1;
   
     if(live==0){
       enemyGenerator.setThereIsBoss(false);
     return true;
     }
     else
     return false; 
  }

  public void increaseScore(Score s) {
    s.increaseScore(3);
  }




}
