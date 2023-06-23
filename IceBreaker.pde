ArrayList<Obstacle> obstacles;
ArrayList<Snowball> snowballs;
ArrayList<Effect> effects;
ArrayList<Stand> stands;
ArrayList<Text> texts;
Terrain terrain;
int score, ammo;
boolean gameOver;

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  colorMode(HSB);
  noStroke();
  perspective(PI/3, float(width)/height, .01, width * width);

  obstacles = new ArrayList<Obstacle>();
  snowballs = new ArrayList<Snowball>();
  effects = new ArrayList<Effect>();
  stands = new ArrayList<Stand>();
  texts = new ArrayList<Text>();
  terrain = new Terrain();
  score = 0;
  ammo = 10;
  gameOver = false;
}

void draw()
{
  background(0);
  camera(0, 0, 0, 0, 0, -1, 0, 1, 0);
  lights();
  terrain.render();

  if (frameCount % 100 == 0)
  {
    obstacles.add(new Obstacle());
    stands.add(new Stand(obstacles.get(obstacles.size()-1)));
  }

  if (ammo <= 0 && snowballs.size() == 0)
  {
    gameOver = true;
  }

  for (int i = 0; i < snowballs.size(); i++)
  {
    Snowball temp = snowballs.get(i);
    temp.render();

    if (temp.tooFar())
    {
      snowballs.remove(i);
      i--;
    }
  }

  for (int i = 0; i < obstacles.size(); i++)
  {
    Obstacle temp = obstacles.get(i);
    temp.render();

    if (temp.isHit() || temp.offScreen())
    {
      obstacles.remove(i);
      i--;
    }
  }

  for (int i = 0; i < effects.size(); i++)
  {
    Effect effect = effects.get(i);
    effect.render();

    if (effect.tooSmall())
    {
      effects.remove(i);
      i--;
    }
  }

  for (int i = 0; i < stands.size(); i++)
  {
    Stand stand = stands.get(i);
    stand.render();

    if (stand.offScreen())
    {
      stands.remove(i);
      i--;
    }
  }
  
  for(int i = 0; i < texts.size(); i++)
  {
    Text text = texts.get(i);
    text.render();
    
    if(text.tooSmall())
    {
      texts.remove(i);
      i--;
    }
  }

  hint(DISABLE_DEPTH_TEST);
  camera();
  fill(255);
  textSize(50);
  text("Score: " + score, width/2, height * .05);

  text("Snowballs: " + ammo, width/2, height * .9);

  if (gameOver)
  {
    noStroke();
    fill(frameCount * 2 % 255, 255,255);
    textSize(100);

    String text = "Game Over!";
    float x = width/2 - 60 * text.length()/2  + 30;
    
    for(int i = 0; i < text.length(); i++)
    {
      String letter = text.substring(i,i+1);
      text(letter,x,height/2 + sin(x * .1 + frameCount * .1) * 100);
      x += 60;
    }
    
    if(keyPressed && key == ' ')
      setup();
  }
  hint(ENABLE_DEPTH_TEST);
}
