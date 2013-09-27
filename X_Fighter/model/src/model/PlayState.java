package model;

public class PlayState implements IBoardState {

	private GameBoard board;

	public PlayState(GameBoard b) {
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
	}

}
