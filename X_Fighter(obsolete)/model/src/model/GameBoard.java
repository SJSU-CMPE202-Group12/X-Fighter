package model;

import java.util.*;

import processing.core.*;

public class GameBoard extends PApplet {
	private int width;
	private int height;
	private IBoardState current_state;
	private List<Button> buttons;

	public GameBoard() {
		this(300, 500);
	}

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

	public void mousePressed() {
		for (Button b : buttons) {
			if (b.over()) {
				toState(b.eventName);
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

	public void triggered() {

	}

	public void drawText(String s) {
		PFont f = createFont("Arial", 16, true);
		textFont(f, 36);
		fill(255);
		text(s, 10, 100);
	}

	// public void drawMenu(String [] items){
	// PFont f = createFont("Arial", 12, true);
	// textFont(f, 20);
	// fill(255);
	// int x = 10;
	// int y = 200;
	//
	// buttons.clear();
	//
	// if(items != null) {
	// for(int i = 0; i< items.length; i++) {
	// Button b = new Button( x, y, items[i]);
	// b.draw();
	// buttons.add(b);
	// y += 40;
	// }
	// }
	// }

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

	public void initPlayScene() {
		background(0);
		String s = "" + Score.counter;
		PFont f = createFont("Arial", 12, true);
		textFont(f, 12);
		textAlign(LEFT);
		text("Score", 10, 10);
		text(s, 22, 22);
	}

	public class Button {
		List<IButtonListener> listeners = new ArrayList<IButtonListener>();
		int x, y;
		String label;
		String eventName;

		Button(int x, int y, String label, String eventName) {
			this.x = x;
			this.y = y;
			this.label = label;
			this.eventName = eventName;
		}

		public void draw() {
			fill(0);
			if (over()) {
				fill(200);
			}
			rect(x, y, textWidth(label), 25);
			fill(255);
			text(label, x, y + 20);
		}

		boolean over() {
			if (mouseX >= x && mouseY >= y && mouseX <= x + textWidth(label)
					&& mouseY <= y + 22) {
				return true;
			}
			return false;
		}

		public void addListener(IButtonListener l) {
			listeners.add(l);
		}

		public void click() {
			for (IButtonListener l : listeners) {
				l.triggered();
			}
		}

	}
}
