import java.util.Dictionary;
import java.util.Hashtable;

public class GameOverState extends GameState {
  
  public GameOverState(GameBoard b) {
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
  public void draw() {
    board.drawText("Game Over");
    
    LinkedHashMap<String, String> dict = new LinkedHashMap<String, String>();
    dict.put("Start Over", "play");
    dict.put("Back to Main Menu", "mainmenu");
    board.drawMenu(dict);
    
    board.drawSummary("Your Score is " + board.getScorePoints(), 130);
  }

}

