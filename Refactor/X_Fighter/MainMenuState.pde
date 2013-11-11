import java.util.*;

public class MainMenuState implements IBoardState {
  
  private GameBoard board;
  
  public MainMenuState(GameBoard b) {
    board = b;
  }

  @Override
  public void toPlay() throws XFighterException {
    board.setState(EnuBoardState.PLAY);
  }

  @Override
  public void toAbout() throws XFighterException {
    board.setState(EnuBoardState.ABOUT);
  }

  @Override
  public void toPause() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void toMainMenu() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void toGameOver() throws XFighterException {
    throw new XFighterException();
  }

  @Override
  public void draw() {
    board.drawText("X-Fighter");
    
    LinkedHashMap<String, String> dict = new LinkedHashMap<String, String>();
    dict.put("Challenge", "play");
    dict.put("About", "about");
    board.drawMenu(dict);
  }
}
