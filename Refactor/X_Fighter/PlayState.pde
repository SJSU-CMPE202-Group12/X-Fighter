import java.util.Dictionary;
import java.util.Hashtable;

public class PlayState implements IBoardState {

  private GameBoard board;
  private EnemyGenerator enemyGenerator; 

  public PlayState(GameBoard b) {
    board = b;
    gameComponents = new GameComponents(); 
    
    fighter = new Fighter(b.getWidth()/2, b.getHeight());    
    enemyGenerator = new EnemyGenerator();         
   
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

  @Override
  public void draw() {
    fighter.shoot();
    enemyGenerator.update();
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

