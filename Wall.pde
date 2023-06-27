int counter = 5;

class Wall implements Renderable
{
  PVector pos, size;
  int health, points;

  public Wall()
  {
    pos = new PVector(0, 0, -width * 3);
    size = new PVector(width * .4, height, width * .1);
    health = counter;
    points = counter * 100;
    counter++;
  }

  void render()
  {
    fill(#9CCECA);

    push();
    translate(pos.x, pos.y, pos.z);
    box(size.x, size.y, size.z);
    
    translate(0,-size.y/2 * 1.15,0);
    noFill();
    stroke(255);
    rect(0,0,size.x,size.y * .1);
    
    rectMode(NORMAL);
    noStroke();
    fill(255);
    translate(-size.x/2,-size.y *.05);
    rect(0,0,(size.x/(counter-1)) * health,size.y * .1);
    rectMode(CENTER);
    pop();

    pos.z += 15;
  }

  boolean shouldRemove()
  {
    if(pos.z >= 0)
    {
      ammo = 0;
      gameOver = true;
      return true;
    }
      
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
        
        snowballs.remove(i);
        health--;

        if (health <= 0)
        {
          score += points;
          items.add(new Text(pos,points));
          
          for (int j = 0; j < 20; j++)
          {
            PVector temp2 = new PVector(pos.x + random(-size.x/2,size.x/2), pos.y + random(-size.y/2,size.y/2), pos.z);
            for (int k = 0; k < 10; k++)
              items.add(new Effect(temp2));
          }

          return true;
        }
      }
    }

    return false;
  }
}
