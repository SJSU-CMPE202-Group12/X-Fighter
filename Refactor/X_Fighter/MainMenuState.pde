import java.util.*;

public class MainMenuState extends GameState {
  
  public MainMenuState(GameBoard b) {
    super(b);
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
  public void draw() {
    board.drawText("X-Fighter");
    
    LinkedHashMap<String, String> dict = new LinkedHashMap<String, String>();
    dict.put("Challenge", "play");
    dict.put("About", "about");
    board.drawMenu(dict);
  }
}
