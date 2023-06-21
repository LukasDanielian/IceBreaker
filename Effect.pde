class Effect
{
  PVector pos, vel;
  float size, sizeChanger;
  
  Effect(PVector pos)
  {
    this.pos = new PVector(pos.x + random(-25,25), pos.y + random(-25,25), pos.z + random(-25,25));
    vel = new PVector(random(-10,10),random(-10,10),random(-10,10));
    size = random(25,50);
    sizeChanger = random(.1,.5);
  }
  
  void render()
  {
    fill(#9CCECA);
    
    push();
    translate(pos.x,pos.y,pos.z);
    rotateX(frameCount * .1);
    rotateY(frameCount * .1);
    rotateZ(frameCount * .1);
    box(size);
    pop();
    
    size -= sizeChanger;
    pos.add(vel);
    vel.y += 1;
  }
  
  boolean tooSmall()
  {
    return size <= 0;
  }
}
