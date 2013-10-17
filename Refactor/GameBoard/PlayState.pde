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
    
    //explosions =new ArrayList<Explosion>();  
     //Gif Animation = new Gif(this, "Explosion.gif");
     //myAnimation=Animation; 
  
 // collision =new ArrayList<Boolean>() ;
  //collision.add(false);

   
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
  public void toGameOver() throws XFighterException {
    if (beShot()) {
      board.setState(EnuBoardState.GAME_OVER);
    }
  }

  // todo: hit logic
  private boolean beShot() {
    return true;
  }

  @Override
  public void draw() {
    board.drawText("Play");

    initPlayScene();
      
    fighter.move();
    fighter.shoot();
    fighter.display();  
    enemyGenerator.display(fighter);      
//    if(collision.get(collision.size()-1)){
//      explosions.get(explosions.size()-1).display();
//    } 
  
  }
  
  public void initPlayScene() {
    background(0);
    String s = "" + Score.counter;
    PFont f = createFont("Arial", 12, true);
    textFont(f, 12);
    textAlign(LEFT);
    text("Score", 10, 10);
    text(s, 22, 22);
    
    Button pauseButton = new Button(board.getWidth()-20, 0, "  ||  ", "pause");
    board.drawMenu(pauseButton);
  }

}

