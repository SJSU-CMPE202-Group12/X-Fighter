package model;

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
		
		Dictionary<String, String> dict = new Hashtable<String, String>();
		dict.put("Play(New) ¡ü", "play");
		dict.put("Back to Main Menu ¡ú", "mainmenu");
		board.drawMenu(dict);
	}

}
