import java.util.Dictionary;
import java.util.Hashtable;

public class AboutState extends GameState {
  
  public AboutState(GameBoard b) {
    super(b);
  }

  @Override
  public void toMainMenu() throws XFighterException {
    board.setState(EnuBoardState.MAIN_MENU);
  }

  @Override
  public void draw() {
    board.drawText("About");
    
    board.drawDescription("Press <UP>, <DOWN>, <LEFT>, <RIGHT> to control.", 300);
    board.drawDescription("Enjoy it!", 320);
    
    LinkedHashMap<String, String> dict = new LinkedHashMap<String, String>();
    dict.put("Back to Main Menu", "mainmenu");
    board.drawMenu(dict);
  }

}
