ArrayList<PVector>pt;

void setup()
{
  size(400,400);
  background(255);
  pt=new ArrayList<PVector>();
}

float ghostX=400,ghostY=20;

void mouseDragged()  //按下鍵再移動
{
  pt.add(new PVector(mouseX,mouseY));
}
void draw()
{
  background(255);
  ellipse(200,200,15,15);  //ghost
  ellipse(ghostX,ghostY,15,15);
  strokeWeight(4);
  float dpx=0,dpy=0;  //累積移動量
  
  for (int i=0;i<pt.size()-1;i++)
  {
    PVector p=pt.get(i),p2=pt.get(i+1);
    line(p.x,p.y,p2.x,p2.y);
    dpx+=abs(p2.x-p.x);  //X累積移動量
    dpy+=abs(p2.y-p.y);  //累積Y移動量
  }
  
  if(dpx>100 && dpy<40)  stroke(255,0,0);  //  改變線的顏色
  else stroke(0);
  
  for (int i=0;i<pt.size()-1;i++)
  {
    PVector p=pt.get(i),p2=pt.get(i+1);
    line(p.x,p.y,p2.x,p2.y);
  }
  
  float dx=200-ghostX,dy=200-ghostY,len=sqrt(dx*dx+dy*dy);
  ghostX+=dx/len/3;  //移動X座標
  ghostY+=dy/len/3;  //移動Y座標
}

void mouseReleased()
{
  for(int i=pt.size()-1;i>=0;i--)
  {
    pt.remove(i);
  }
}
