class Snowball implements Renderable
{
  PVector pos, vel;
  
  Snowball()
  {
    pos = new PVector(0,50,0);
    vel = new PVector(map(mouseX,0,width,-40,40),map(mouseY,0,height,-40,25),-50);
  }
  
  void render()
  {
    fill(255);
    pushMatrix();
    noStroke();
    translate(pos.x,pos.y,pos.z);
    sphere(15);
    popMatrix();
    
    pos.add(vel);
    vel.y += .5;
  }
  
  boolean shouldRemove()
  {
    return pos.y > height;
  }
}
