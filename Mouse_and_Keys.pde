void keyPressed()
{
  if(ammo > 0 && key == ' ')
  {
    snowballs.add(new Snowball());
    ammo--;
  }
}

void mousePressed()
{
  if(ammo > 0)
  {
    snowballs.add(new Snowball());
    ammo--;
  }
}
