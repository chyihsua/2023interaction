ArrayList<PVector>pt;

void setup()
{
  size(400,400,P3D);
  pt=new ArrayList<PVector>();
  for(int i=0;i<37;i++)
  {
    pt.add(new PVector(random(400),random(400)));
  }  //假設畫面中已經畫好20個頂點
}

void draw()
{
  background(255);
  for (PVector p:pt)
  {
    ellipse(p.x,p.y,10,10);
  }
  if (ans!=null)
  {
    ellipse(ans.x,ans.y,15,15);
  }
}

PVector ans=null;   //空指標

void mouseDragged()  //拖曳函式
{
  if(mouseButton==CENTER && ans!=null)
  {
    ans.x=mouseX;
    ans.y=mouseY;
  }
}

void mousePressed()
{
  if (mouseButton==LEFT)  //左鍵加點
    pt.add(new PVector(mouseX,mouseY));
  else if(mouseButton==CENTER)  //中鍵選點
  {
    for(PVector p:pt)
    {
      if (dist(p.x,p.y,mouseX,mouseY)<5)  //如果距離小於5
      {
        ans=p;
      }
    }
  }
}
