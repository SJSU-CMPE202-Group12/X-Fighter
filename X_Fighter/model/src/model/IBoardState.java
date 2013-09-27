package model;

public interface IBoardState {

	public void toPlay() throws XFighterException;

	public void toAbout() throws XFighterException;

	public void toPause() throws XFighterException;

	public void toMainMenu() throws XFighterException;

	public void toGameOver() throws XFighterException;

	public void draw();

}
