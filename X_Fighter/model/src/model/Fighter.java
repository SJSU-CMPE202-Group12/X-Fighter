package model;

import java.util.ArrayList;

import processing.core.*;

public class Fighter extends PApplet {
	int xpos; // x coordinate of center of my plane
	int ypos; // y coordinate of center of my plane
	int speed = 2; // move 2 pixels per frame if the arrow key is pressed
	int shootRate = 15; // shoot one bullet every 15 frames
	int nextShoot = 0; // when to shoot the next bullet
	int size = 25;
	int planeHeight = 2 * size;

	ArrayList<Bullet> bullets;
	PImage myPlaneImg;

	Fighter(int x, int y) {
		bullets = new ArrayList<Bullet>();
		myPlaneImg = loadImage("myplane.png");
		myPlaneImg.resize(getWidth(), getHeight());
		xpos = x;
		ypos = y - getHeight() / 2;
	}

	public int getX() {
		return xpos;
	}

	public int getY() {
		return ypos;
	}

	public int getWidth() {
		return 2 * size;
	}

	public int getHeight() {
		return planeHeight;
	}

	void shoot() {
		if (nextShoot == 0) {
			nextShoot = shootRate;
			bullets.add(new Bullet(xpos, ypos - getHeight() / 2));
		}
		nextShoot -= 1;
	}

	// remove the bullet that run out of lifetime and display others
	void updateBullet() {
		for (int i = bullets.size() - 1; i >= 0; i--) {
			Bullet b = bullets.get(i);
			if (b.lifetime == 0)
				bullets.remove(i);
			else
				b.display();
		}
	}

	// plane is controled by arrow keys;
	void move() {
		if (keyPressed) {
			if (key == CODED) {
				if (keyCode == LEFT && (xpos - getWidth() / 2 - speed) > 0)
					xpos -= speed;

				if (keyCode == RIGHT && (xpos + getWidth() / 2 + speed) < width)
					xpos += speed;

				if (keyCode == UP && (ypos - getHeight() / 2 - speed) > 0)
					ypos -= speed;

				if (keyCode == DOWN
						&& (ypos + getHeight() / 2 + speed) < height)
					ypos += speed;
			}
		}
	}

	void display() {
		imageMode(CENTER);
		image(myPlaneImg, xpos, ypos);
		updateBullet();
	}
}
