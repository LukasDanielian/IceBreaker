ArrayList<Obstacle> obstacles;
ArrayList<Snowball> snowballs;
ArrayList<Effect> effects;
ArrayList<Stand> stands;
float speed;

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  noStroke();
  camera(0,0,0,  0,0,-1,  0,1,0);
  perspective(PI/3, float(width)/height, .01, width * width);
  
  obstacles = new ArrayList<Obstacle>();
  snowballs = new ArrayList<Snowball>();
  effects = new ArrayList<Effect>();
  stands = new ArrayList<Stand>();
  speed = 10;
}

void draw()
{
  background(0);
  lights();
  spotLight(255,255,255,  0,0,0, 0,0,-1,PI/3, 100);
  fill(100);
  box(width,height,width * 10);
  
  if(frameCount % 100 == 0)
  {
    obstacles.add(new Obstacle());
    stands.add(new Stand(obstacles.get(obstacles.size()-1)));
    speed += .5;
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
}
