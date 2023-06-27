class Stand implements Renderable
{
  PVector pos, size;
  
  Stand(PVector pos, PVector size)
  {
    this.pos = new PVector(pos.x, (pos.y + size.y/2 + height)/2, pos.z);
    this.size = new PVector(size.x * 1.5, height - pos.y - size.y/2, size.z * 1.5);
  }
  
  void render()
  {
    fill((frameCount*.1) % 255,255,255);
    noStroke();
    push();
    translate(pos.x,pos.y,pos.z);
    box(size.x,size.y,size.z);
    pop();
    
    pos.z += 15;
  }
  
  boolean shouldRemove()
  {
    return pos.z > 0;
  }
}
