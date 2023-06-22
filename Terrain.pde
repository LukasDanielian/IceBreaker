class Terrain
{
  int cols, rows, scale;
  float[][] grid;
  
  Terrain()
  {
    scale = 50;
    cols = (width * 4)/scale;
    rows = (width * 4)/scale;
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
    translate(-width * 2,height * .75,0);
    noFill();
    
    for(int z = 0; z < rows-1; z++)
    {
      beginShape(TRIANGLE_STRIP);
      for(int x = 0; x < cols; x++)
      {
        stroke((frameCount*.1) % 255,255,200);
        vertex(x*scale,grid[x][z],-z*scale);
        vertex(x*scale, grid[x][z+1],-(z+1)*scale);
      }
      endShape();
    }
    
    pop();
    noStroke();
  }
}
