class Text implements Renderable
{
  float size;
  PVector pos;
  int amount;
  
  Text(PVector loc, int amount)
  {
    this.pos = loc.copy();
    this.amount = amount;
    size = 100;
  }
  
  void render()
  {
    textSize(size);
    fill(#9CCECA);
    noStroke();
    push();
    translate(pos.x,pos.y,pos.z);
    text("+" + amount,0,0);
    pop();
    
    pos.z += 15;
    size -= 1;
  }
  
  boolean shouldRemove()
  {
    return size <= 0;
  }
}
