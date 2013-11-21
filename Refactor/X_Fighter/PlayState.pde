import java.util.Dictionary;
import java.util.Hashtable;

public class PlayState extends GameState {

  private Fighter fighter;
  private EnemyGenerator enemyGenerator; 
  private GameComponents gameComponents; // a collection of the Bullet, Enemy, MyPlane, Explosion components in the game
  private GameComponents fighterComponents;
  private GameComponents enemyComponents;
  private TreasureFactory treasure;
  private Blink blink;
  private AudioPlayer player;

  public PlayState(GameBoard b) {
    super(b);
  player = minim.loadFile("POL-time-travel-short.mp3");

  player.loop();

    gameComponents = new GameComponents(); 
    fighterComponents = new GameComponents();
    enemyComponents = new GameComponents();
    gameComponents.addChild(fighterComponents);
    gameComponents.addChild(enemyComponents);

    fighter = new Fighter(b.getWidth()/2, b.getHeight(), fighterComponents);  
    fighterComponents.addChild(fighter);
    enemyGenerator = new EnemyGenerator(enemyComponents);

    board.setScore(enemyGenerator.getScore());
    enemyComponents.setScore(board.getScore());
    enemyGenerator.attachObserver();

    treasure = new TreasureFactory(fighter, gameComponents, fighterComponents);
    blink = new Blink(500, false);    
  }
  
  @Override
  public void toPause() {
    pause();
    board.setState(EnuBoardState.PAUSE);
  }

  @Override
  public void toGameOver() {
    if (beShot())
      board.setState(EnuBoardState.GAME_OVER);
  }

  private void pause() {
    board.setRecoverGame(this);
    player.pause();
    fighter.pause(); 
  }
  
  public void resume() {
    board.setRecoverGame(null);
    player.play();
    fighter.resume();
  }

  private boolean beShot() {
    return fighter.getLife() <= 0;
  }

  private void checkCollision() {
    //check collision between enemy and fighter
    for (IComponent e : enemyComponents) {
      Collide enemy = (Collide) e;
      for (IComponent c : fighterComponents) {
        Collide fighter = (Collide) c;
        if (enemy.collision(fighter))
        {
          boolean collision = enemy.destroy();
          fighter.destroy();
          if(collision == true)
          gameComponents.addChild(new Explosion(enemy.getX(), enemy.getY()));          
          //if enemy collide with my plane and my plane is visible, then my plane will explode too
          if (fighter.getClass().getName() == "X_Fighter$Fighter" && ((Fighter)fighter).visible()) {            
            gameComponents.addChild(new Explosion(fighter.getX(), fighter.getY()));
          }
        }
      }
    }
  }


  @Override
  public void draw() {
    enemyGenerator.update();
    checkCollision();
    gameComponents.display();
    treasure.manageTreasure();
    drawPlayScene();
    toGameOver();
  }

  public void drawPlayScene() {
    //background(0);

    String s = "" + board.getScorePoints();
    PFont f = createFont("Franklin Gothic Demi", 20, true);
    textFont(f, 12);
    textAlign(LEFT);
    text("Level ", 20, 20);
    text(enemyGenerator.getLevel(), 55, 20);  
    text("Score", 20, 40);
    text(s, 55, 40);
    text("Live", 20, 60);
    text(fighter.getLife(), 55, 60);
    
    // displaying timer if you have a TimedShooter on the fighter
    IShootStrategy shooter;
    shooter = fighter.getShooter(); 
    if(shooter instanceof TimedShooter)
    {
      int totalTime = ((TimedShooter) shooter).getTimeLeft() / 10;
      
      if(blink.display(totalTime))
      {
        int x = width - 22;
        int y = height - 25;
        textAlign(RIGHT);
        text(((TimedShooter) shooter).getTimerName(), x, height - 40);
        text(String.format("%02d", totalTime % 100), x, y);
        x -= 22;
        totalTime /= 100;
        text(String.format("%02d", totalTime % 60) + " :", x, y);
        x -= 22;
        totalTime /= 60;
        text(String.format("%02d", totalTime) + " :", x, y);
      }
    }

    Button pauseButton = new Button(board.getWidth()-20, 0, "  ||  ", "pause", LEFT);
    board.drawMenu(pauseButton);
  }
}

