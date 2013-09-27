package model;

import processing.core.*;

public class GameBoard extends PApplet {
	private int width;
	private int height;
	private IBoardState current_state;

	public GameBoard() {
		this(300, 500);
	}

	public GameBoard(int w, int h) {
		width = w;
		height = h;
		current_state = new MainMenuState(this);
	}

	public void setup() {
		size(width, height);
		background(0);
	}

	public void setState(EnuBoardState enuState) {
		switch (enuState) {
		case MAIN_MENU:
			current_state = new MainMenuState(this);
			break;
		case ABOUT:
			current_state = new AboutState(this);
			break;
		case PLAY:
			current_state = new PlayState(this);
			break;
		case PAUSE:
			current_state = new PauseState(this);
			break;
		case GAME_OVER:
			current_state = new GameOverState(this);
			break;
		}
	}

	public void draw() {
		background(0);
		current_state.draw();
	}

	public void keyPressed() {
		try {
			if (keyCode == UP) {
				current_state.toPlay();
			} else if (keyCode == DOWN) {
				current_state.toAbout();
			} else if (keyCode == LEFT) {
				current_state.toPause();
			} else if (keyCode == RIGHT) {
				current_state.toMainMenu();
			} else if (keyCode == ENTER) {
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
}
