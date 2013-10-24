import java.util.Dictionary;
import java.util.Hashtable;

public class PlayState implements IBoardState {

  private GameBoard board;
  private Fighter fighter;
  private EnemyGenerator enemyGenerator; 

  public PlayState(GameBoard b) {
    board = b;
    fighter = new Fighter(b.getWidth()/2, b.getHeight());
    enemyGenerator = new EnemyGenerator(b.getWidth(), b.getHeight());  
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
    if (beShot()) {
      board.setState(EnuBoardState.GAME_OVER);
      Score.COUNTER = 0;
    }
  }

  private boolean beShot() {
    return fighter.live == 0;
  }

  @Override
  public void draw() {
    
    fighter.move();
    fighter.shoot();
    fighter.display();  
    enemyGenerator.display(fighter);  
    
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
    
    Button pauseButton = new Button(board.getWidth()-20, 0, "  ||  ", "pause", LEFT);
    board.drawMenu(pauseButton);
  }

}

