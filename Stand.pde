class Stand
{
  PVector pos, size;
  
  Stand(Obstacle o)
  {
    pos = new PVector(o.pos.x, (o.pos.y + o.size.y/2 + height)/2, o.pos.z);
    size = new PVector(o.size.x * 1.5, height - o.pos.y - o.size.y/2, o.size.z * 1.5);
  }
  
  void render()
  {
    fill(100);
    
    push();
    translate(pos.x,pos.y,pos.z);
    box(size.x,size.y,size.z);
    pop();
    
    pos.z += speed;
  }
  
  boolean offScreen()
  {
    return pos.z > 0;
  }
}
