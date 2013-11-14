import java.util.Dictionary;
import java.util.Hashtable;

public class GameOverState implements IBoardState {
  
  private GameBoard board;
  
  public GameOverState(GameBoard b) {
    board = b;
  }

  @Override
  public void toPlay() throws XFighterException {
    initPlay();
    board.setState(EnuBoardState.PLAY);
  }
  
  private void initPlay() {
    
  }

  @Override
  public void toAbout() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void toPause() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void toMainMenu() throws XFighterException {
    board.setState(EnuBoardState.MAIN_MENU);
  }

  @Override
  public void toGameOver() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void draw() {
    board.drawText("Game Over");
    
    LinkedHashMap<String, String> dict = new LinkedHashMap<String, String>();
    dict.put("Start Over", "play");
    dict.put("Back to Main Menu", "mainmenu");
    board.drawMenu(dict);
    
    board.drawSummary("Your Score is " + board.getScorePoints(), 130);
  }

}

