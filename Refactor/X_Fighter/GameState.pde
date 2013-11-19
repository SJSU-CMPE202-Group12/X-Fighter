class GameState implements IBoardState {
  
  protected GameBoard board;
  
  public GameState(GameBoard b) {
    board = b;
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
  public void toResumeGame() throws XFighterException {
    throw new XFighterException();
  }  

  @Override
  public void draw() {
    board.drawText("Error");
    
    LinkedHashMap<String, String> dict = new LinkedHashMap<String, String>();
    dict.put("Back to Main Menu", "mainmenu");
    board.drawMenu(dict);
  }
}
