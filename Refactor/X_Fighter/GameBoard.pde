import java.util.*;

class GameBoard {
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
    PFont f = createFont("Arial", 16, true);
    textFont(f, 36);
    fill(255);
    text(s, 10, 100);
  }
  
  public void drawMenu(Dictionary<String, String> dict) {
    PFont f = createFont("Arial", 12, true);
    textFont(f, 20);
    fill(255);
    int x = 10;
    int y = 200;
  
    buttons.clear();
  
    Enumeration<String> keyEnu = dict.keys();
    while (keyEnu.hasMoreElements()) {
      String key = keyEnu.nextElement();
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
