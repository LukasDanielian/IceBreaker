void gameConditions()
{
  if (frameCount % 100 == 0)
  {
    Obstacle toAdd = new Obstacle();
    items.add(toAdd);
    items.add(new Stand(toAdd.pos,toAdd.size));
  }

  if (frameCount % 1000 == 0)
  {
    Wall toAdd = new Wall();
    items.add(toAdd);
    items.add(new Stand(toAdd.pos,toAdd.size));
  }

  if (ammo <= 0 && snowballs.size() == 0)
    gameOver = true;
    
  if(gameOver && score > highScore)
  {
    highScore = score;
    PrintWriter output = createWriter("/data/highScore.txt");
    output.println(highScore);
    output.flush();
    output.close();
  }
}

void renderObjects()
{
  for (int i = 0; i < snowballs.size(); i++)
  {
    Snowball temp = snowballs.get(i);
    temp.render();

    if (temp.shouldRemove())
    {
      snowballs.remove(i);
      i--;
    }
  }
  
  for(int i = 0; i < items.size(); i++)
  {
    Renderable item = items.get(i);
    item.render();
    
    if(item.shouldRemove())
    {
      items.remove(i);
      i--;
    }
  }
}

//Visual guide for aim assist
void renderHelperLine()
{
  PVector pos = new PVector(0, 50, 0);
  PVector vel = new PVector(map(mouseX, 0, width, -40, 40), map(mouseY, 0, height, -40, 25), -50);

  noFill();
  beginShape();
  strokeWeight(5);
  for (int i = 0; i < 25; i++)
  {
    stroke((i*15 - frameCount * 10 & 255), 255, 255);
    curveVertex(pos.x, pos.y, pos.z);

    pos.add(vel);
    vel.y += .5;
    vel.z -= 1;
  }
  endShape();
}

//Heads up Display
void renderHUD()
{
  hint(DISABLE_DEPTH_TEST);
  camera();
  fill(255);
  textSize(30);
  text("High Score: " + highScore + "\nScore: " + score, width/2, height * .1);
  text("Snowballs: " + ammo, width/2, height * .9);

  textSize(10);
  text("FPS: " + frameRate, width * .98, height * .01);

  if (gameOver)
  {
    noStroke();
    fill(frameCount * 2 % 255, 255, 255);
    textSize(100);

    String text = "Game Over!";
    float x = width/2 - 60 * text.length()/2  + 30;

    for (int i = 0; i < text.length(); i++)
    {
      String letter = text.substring(i, i+1);
      text(letter, x, height/2 + sin(x * .01 + frameCount * .1) * 100);
      x += 60;
    }

    if (keyPressed && key == ' ')
      setup();
  }
  hint(ENABLE_DEPTH_TEST);
}
