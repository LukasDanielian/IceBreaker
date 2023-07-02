class Star implements Renderable
{
  PVector pos;
  
  Star()
  {
    pos = new PVector(random(-width * 2, width * 2),random(-height, height/2), -width);
    
    while(dist(pos.x,pos.y,pos.z,0,0,-width) <= width/3)
      pos = new PVector(random(-width * 2, width * 2),random(-height, height/2), -width);
  }
  
  void render()
  {
    noStroke();
    fill(255);
    
    push();
    translate(pos.x,pos.y,pos.z);
    rotate(frameCount);
    box(1);
    pop();
    
    pos.z += 5;
  }
  
  boolean shouldRemove()
  {
    return pos.z >= 0;
  }
}
