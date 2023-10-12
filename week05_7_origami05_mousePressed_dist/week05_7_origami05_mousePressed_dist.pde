ArrayList<PVector>pt;

void setup()
{
  size(400,400,P3D);
  pt=new ArrayList<PVector>();
  for(int i=0;i<20;i++)
  {
    pt.add(new PVector(i*20,20));
  }  //假設畫面中已經畫好20個頂點
}

void draw()
{
  background(255);
  for (PVector p:pt)  //畫出20個頂點
  {
    ellipse(p.x,p.y,10,10);
  }
  if (ans!=null)
  {
    ellipse(ans.x,ans.y,15,15);
  }
}

PVector ans=null;   //空指標
void mousePressed()
{
  for(PVector p:pt)
  {
    if (dist(p.x,p.y,mouseX,mouseY)<5)  //如果距離小於5
    {
      ans=p;
    }
  }
}
