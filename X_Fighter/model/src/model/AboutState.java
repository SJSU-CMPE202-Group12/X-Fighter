package model;

public class AboutState implements IBoardState {
	
	private GameBoard board;
	
	public AboutState(GameBoard b) {
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
	public void draw() {
		board.drawText("About");
	}

}
