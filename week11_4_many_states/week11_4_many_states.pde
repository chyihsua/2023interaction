int state=0;  //0:white,1:red,2:blue

void setup()
{
  size(400,400);
}

void draw()
{
  if (state==0)
  {
    background(255);
  }
  else if(state==1)
  {
    background(255,0,0);
  }
  else if(state==2)
  {
    background(0,0,255);
  }
}
