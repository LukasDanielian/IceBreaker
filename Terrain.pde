class Terrain implements Renderable
{
  int cols, rows, scale;
  float[][] grid;
  
  Terrain()
  {
    scale = 50;
    cols = (width * 2)/scale;
    rows = (width * 3)/scale;
    grid = new float[cols][rows];
  }
  
  void render()
  {
    float zoff = frameCount * .015;
    
    for(int z = 0; z < rows; z++)
    {
      float xoff = 0;
      for(int x = 0; x < cols; x++)
      {
        grid[x][z] = map(noise(xoff,zoff),0,1,-250,250);
        xoff += .05;
      }
      zoff += .05;
    }
    
    push();
    strokeWeight(1);
    stroke((frameCount*.1) % 255,255,200);
    translate(-width,height * .75,0);
    noFill();
    
    for(int z = 0; z < rows-1; z++)
    {
      beginShape(TRIANGLE_STRIP);
      for(int x = 0; x < cols; x++)
      {
        vertex(x*scale,grid[x][z],-z*scale);
        vertex(x*scale, grid[x][z+1],-(z+1)*scale);
      }
      endShape();
    }
    
    pop();
    noStroke();
  }
  
  boolean shouldRemove()
  {
    return frameRate < FPS / 2;
  }
}
