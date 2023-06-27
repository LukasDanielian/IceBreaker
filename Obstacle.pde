class Obstacle implements Renderable
{
  PVector pos, size;

  Obstacle()
  {
    pos = new PVector(random(-width,width), random(-height/4,height/3), -width * 3);
    size = new PVector(height * .1, height * .1, height * .1);
    
    while(abs(pos.x) < width * .2)
      pos.x = random(-width,width);
  }

  void render()
  {
    fill(#9CCECA);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateY(frameCount * .1);
    box(size.x, size.y, size.z);
    popMatrix();

    pos.z += 15;
  }

  boolean shouldRemove()
  {
    if(pos.z > 0)
      return true;
      
    for (int i = 0; i < snowballs.size(); i++)
    {
      PVector temp = snowballs.get(i).pos;

      if
        (
        temp.x > pos.x - size.x/2 &&
        temp.x < pos.x + size.x/2 &&
        temp.y > pos.y - size.y/2 &&
        temp.y < pos.y + size.y/2 &&
        temp.z > pos.z - size.z/2 &&
        temp.z < pos.z + size.z/2
        )
      {
        score += 100;
        snowballs.remove(i);
        ammo += 5;
        
        items.add(new Text(pos,100));
        
        for(int j = 0; j < 10; j++)
          items.add(new Effect(pos));
        
        return true;
      }
    }

    return false;
  }
}
