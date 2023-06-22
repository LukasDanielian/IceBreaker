ArrayList<Obstacle> obstacles;
ArrayList<Snowball> snowballs;
ArrayList<Effect> effects;
ArrayList<Stand> stands;
Terrain terrain;

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  colorMode(HSB);
  noStroke();
  perspective(PI/3, float(width)/height, .01, width * width);
  
  obstacles = new ArrayList<Obstacle>();
  snowballs = new ArrayList<Snowball>();
  effects = new ArrayList<Effect>();
  stands = new ArrayList<Stand>();
  terrain = new Terrain();
}

void draw()
{
  background(0);
  camera(0,0,0,  0,0,-1,  0,1,0);
  lights();
  terrain.render();
  
  if(frameCount % 100 == 0)
  {
    obstacles.add(new Obstacle());
    stands.add(new Stand(obstacles.get(obstacles.size()-1)));
  }
  
  for(int i = 0; i < snowballs.size(); i++)
  {
    Snowball temp = snowballs.get(i);
    temp.render();
    
    if(temp.tooFar())
    {
      snowballs.remove(i);
      i--;
    }
  }
  
  for(int i = 0; i < obstacles.size(); i++)
  {
    Obstacle temp = obstacles.get(i);
    temp.render();
    
    if(temp.isHit() || temp.offScreen())
    {
      obstacles.remove(i);
      i--;
    }
  }
  
  for(int i = 0; i < effects.size(); i++)
  {
    Effect effect = effects.get(i);
    effect.render();
    
    if(effect.tooSmall())
    {
      effects.remove(i);
      i--;
    }
  }
  
  for(int i = 0; i < stands.size(); i++)
  {
    Stand stand = stands.get(i);
    stand.render();
    
    if(stand.offScreen())
    {
      stands.remove(i);
      i--;
    }
  }
  
  
  hint(DISABLE_DEPTH_TEST);
  camera();
  fill(255);
  rect(0,0,100,100);
  hint(ENABLE_DEPTH_TEST);
}
