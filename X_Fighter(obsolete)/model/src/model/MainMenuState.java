package model;

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
		board.drawText("Main Menu");
		
		Dictionary<String, String> dict = new Hashtable<String, String>();
		dict.put("Play(New) ¡ü", "play");
		dict.put("About ¡ý", "about");
		board.drawMenu(dict);
	}

}
