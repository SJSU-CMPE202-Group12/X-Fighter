package model;

import java.util.Dictionary;
import java.util.Hashtable;

public class PlayState implements IBoardState {

	private GameBoard board;
	private Fighter fighter;
	private EnemyGenerator enemyGenerator;

	public PlayState(GameBoard b) {
		board = b;
		fighter = new Fighter(b.getWidth()/2, b.getHeight());
		enemyGenerator = new EnemyGenerator(b.getWidth(), b.getHeight()); 
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
	public void toPause() {
		board.setState(EnuBoardState.PAUSE);
	}

	@Override
	public void toMainMenu() throws XFighterException {
		throw new XFighterException();
	}

	@Override
	public void toGameOver() throws XFighterException {
		if (beShot()) {
			board.setState(EnuBoardState.GAME_OVER);
		}
	}

	// todo: hit logic
	private boolean beShot() {
		return true;
	}

	@Override
	public void draw() {
		board.drawText("Play");
		
		Dictionary<String, String> dict = new Hashtable<String, String>();
		dict.put("Pause ¡û", "pause");
		dict.put("Trigger Gameover ©¼", "gameover");
		board.drawMenu(dict);
		
		board.initPlayScene();
		  
		fighter.move();
		fighter.shoot();
		fighter.display();  
		enemyGenerator.display(fighter);
	}

}
