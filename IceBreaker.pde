ArrayList<Renderable> items;
ArrayList<Snowball> snowballs;
int score, counter, highScore,ammo, FPS = 60;
boolean gameOver;

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  colorMode(HSB);
  hint(ENABLE_STROKE_PERSPECTIVE);
  frameRate(FPS);
  noCursor();
  textSize(128);
  perspective(PI/3, float(width)/height, .01, width * width);
  
  items = new ArrayList<Renderable>();
  snowballs = new ArrayList<Snowball>();
  items.add(new Terrain());
  score = 0;
  counter = 5;
  ammo = 10;
  gameOver = false;
  
  String line = "";
  try{line = createReader("highScore.txt").readLine();}
  catch(IOException e){e.printStackTrace();}
  highScore = Integer.parseInt(line);
}

void draw()
{
  background(0);
  camera(0, 0, 0, 0, 0, -1, 0, 1, 0); 
  lights();
  
  gameConditions();
  renderObjects();
  renderHelperLine();
  renderHUD();
}
