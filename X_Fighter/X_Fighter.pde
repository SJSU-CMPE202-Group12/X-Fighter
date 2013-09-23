int screenHorizontalSize = 300;
int screenVerticalSize = 500;

MyPlane plane;
EnemyPlaneGenerator planeGenerator;

void setup() {
  //blank background
  size(screenHorizontalSize, screenVerticalSize);  

  plane = new MyPlane(width/2, height);
  planeGenerator = new EnemyPlaneGenerator(screenHorizontalSize, screenVerticalSize); 
  
}

void draw() {
  background(0);
  
  plane.move();
  plane.shoot();
  plane.display();  
  planeGenerator.display();
}

