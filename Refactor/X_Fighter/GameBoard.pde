import java.util.*;

public class GameBoard {
  private int width;
  private int height;
  private IBoardState current_state;
  private List<Button> buttons;
  
  public GameBoard(int w, int h) {
    width = w;
    height = h;
    current_state = new MainMenuState(this);
    buttons = new ArrayList<Button>();
  }
  
  public int getWidth() {
    return width;
  }
  
  public int getHeight() {
    return height;
  }
  
  public IBoardState getState() {
    return current_state;
  }
  
  public void setState(int enuState) {
    switch (enuState) {
    case EnuBoardState.MAIN_MENU:
      current_state = new MainMenuState(this);
      break;
    case EnuBoardState.ABOUT:
      current_state = new AboutState(this);
      break;
    case EnuBoardState.PLAY:
      current_state = new PlayState(this);
      break;
    case EnuBoardState.PAUSE:
      current_state = new PauseState(this);
      break;
    case EnuBoardState.GAME_OVER:
      current_state = new GameOverState(this);
      break;
    }
  }
  
  public void mousePressed() {
    if (mousePressed) {
      for (Button b : buttons) {
        if (b.over()) {
          toState(b.eventName);
        }
      }
    }
  }
  
  private void toState(String stateName) {
    try {
      if (stateName.toLowerCase() == "play") {
        current_state.toPlay();
      } else if (stateName.toLowerCase() == "about") {
        current_state.toAbout();
      } else if (stateName.toLowerCase() == "pause") {
        current_state.toPause();
      } else if (stateName.toLowerCase() == "mainmenu") {
        current_state.toMainMenu();
      } else if (stateName.toLowerCase() == "gameover") {
        current_state.toGameOver();
      }
    } catch (XFighterException e) {
      drawText("Error");
    }
  }
  
  public void drawText(String s) {
    PFont f = createFont("Arial", 36, true);
    drawText(f, s, 150, 100, CENTER);
  }
  
  public void drawSummary(String s, int y) {
    PFont f = createFont("Arial", 20, true);
    drawText(f, s, 150, y, CENTER);
  }
  
  public void drawText(PFont f, String s, int x, int y, int align) {
    textFont(f);
    textAlign(align);
    text(s, x, y);
  }
  
  public void drawMenu(LinkedHashMap<String, String> dict) {
    PFont f = createFont("Arial", 12, true);
    textFont(f, 20);
    fill(255);
    int x = 150;
    int y = 200;
  
    buttons.clear();
    
    for(String key : dict.keySet()) {
      Button b = new Button(x, y, key, dict.get(key));
      b.draw();
      buttons.add(b);
      y += 40;
    }
  }
  
  public void drawMenu(Button button) {
    button.draw();
    buttons.add(button);
  }
}
