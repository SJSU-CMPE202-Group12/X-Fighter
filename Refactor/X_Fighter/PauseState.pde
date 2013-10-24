import java.util.Dictionary;
import java.util.Hashtable;

public class PauseState implements IBoardState {
  
  private GameBoard board;
  
  public PauseState(GameBoard b) {
    board = b;
  }

  @Override
  public void toPlay() throws XFighterException {
    board.setState(EnuBoardState.PLAY);
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
    board.drawText("Pause");
    
    LinkedHashMap<String, String> dict = new LinkedHashMap<String, String>();
    dict.put("Resume", "play");
    dict.put("Back to Main Menu", "mainmenu");
    board.drawMenu(dict);
  }
}
