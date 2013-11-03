import java.util.Dictionary;
import java.util.Hashtable;

public class PlayState implements IBoardState {

  private GameBoard board;
  private Fighter fighter;
  private EnemyGenerator enemyGenerator; 
  private GameComponents gameComponents; // a collection of the Bullet, Enemy, MyPlane, Explosion components in the game
  private GameComponents fighterComponents;
  private GameComponents enemyComponents;

  public PlayState(GameBoard b) {
    board = b;
    gameComponents = new GameComponents(); 
    fighterComponents = new GameComponents();
    enemyComponents = new GameComponents();

    gameComponents.addChild(fighterComponents);
    gameComponents.addChild(enemyComponents);

    fighter = new Fighter(b.getWidth()/2, b.getHeight(), fighterComponents);  
    fighterComponents.addChild(fighter);
    enemyGenerator = new EnemyGenerator(enemyComponents);         

    Score.COUNTER = 0;
  }

  @Override
  public void toPlay() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void toAbout() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void toPause() {
    board.setState(EnuBoardState.PAUSE);
  }

  @Override
  public void toMainMenu() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void toGameOver() {
    if (beShot())
      board.setState(EnuBoardState.GAME_OVER);
  }

  private boolean beShot() {
    return fighter.getLife() <= 0;
  }

  private void checkCollision() {
    //check collision between enemy and fighter
    for (Component e : enemyComponents) {
      Collide enemy = (Collide) e;
      for (Component c : fighterComponents) {
        Collide fighter = (Collide) c;
        if (enemy.collision(fighter))
        {
          enemy.destroy();
          fighter.destroy();
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

    drawPlayScene();
    toGameOver();
  }

  public void drawPlayScene() {
    //background(0);

    String s = "" + Score.COUNTER;
    PFont f = createFont("Arial", 12, true);
    textFont(f, 12);
    textAlign(LEFT);
    text("Level ", 20, 20);
    text(enemyGenerator.getLevel(), 55, 20);  
    text("Score", 20, 40);
    text(s, 55, 40);
    text("Live", 20, 60);
    text(fighter.getLife(), 55, 60);

    Button pauseButton = new Button(board.getWidth()-20, 0, "  ||  ", "pause", LEFT);
    board.drawMenu(pauseButton);
  }
}

