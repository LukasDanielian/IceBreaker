class Wall
{
  PVector pos, size;
  int health;

  public Wall()
  {
    pos = new PVector(0, 0, -width * 3);
    size = new PVector(width * .4, height, width * .1);
    health = 5;
  }

  void render()
  {
    fill(#9CCECA);

    push();
    translate(pos.x, pos.y, pos.z);
    box(size.x, size.y, size.z);
    pop();

    pos.z += 15;
  }

  boolean isHit()
  {
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
        
        snowballs.remove(i);m
        health--;

        if (health <= 0)
        {
          score += 500;
          texts.add(new Text(pos,500));
          
          for (int j = 0; j < 20; j++)
          {
            PVector temp2 = new PVector(pos.x + random(-size.x/2,size.x/2), pos.y + random(-size.y/2,size.y/2), pos.z);
            for (int k = 0; k < 10; k++)
              effects.add(new Effect(temp2));
          }

          return true;
        }
      }
    }

    return false;
  }

  boolean atCamera()
  {
    return pos.z >= 0;
  }
}
