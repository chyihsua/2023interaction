void setup()
{
  size(600,600);
}

int n=1;
void draw()
{
  background(255);
  ellipse(mouseX,mouseY,10,10);
 
}

void keyPressed()
{
  n++;
  plus();
}

void plus()
{
  for(int i=0;i<n;i++)
  {
    ellipse(20,10,10,10);
  }
}
