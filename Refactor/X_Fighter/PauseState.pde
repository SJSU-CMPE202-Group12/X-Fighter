import java.util.Dictionary;
import java.util.Hashtable;

public class PauseState extends GameState {
  
  public PauseState(GameBoard b) {
    super(b);
  }

  @Override
  public void toPlay() throws XFighterException {
    board.setState(EnuBoardState.PLAY);
  }

  @Override
  public void toMainMenu() throws XFighterException {
    board.setState(EnuBoardState.MAIN_MENU);
  }
  
  @Override
  public void toResumeGame() throws XFighterException {
    board.setState(EnuBoardState.RECOVER_GAME);
  }

  @Override
  public void draw() {
    board.drawText("Pause");
    
    LinkedHashMap<String, String> dict = new LinkedHashMap<String, String>();
    dict.put("Resume", "resume");
    dict.put("New Game", "play");
    dict.put("Back to Main Menu", "mainmenu");
    board.drawMenu(dict);
  }
}
