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
  ellipse(200,200,15,15);  //  ghost
  //if (mousePressed)  line(mouseX,mouseY,pmouseX,pmouseY);
  for (int i=0;i<pt.size();i++)
  {
    PVector p=pt.get(i);
    ellipse(p.x,p.y,3,3);
  }
  ellipse(ghostX,ghostY,15,15);
  float dx=200-ghostX,dy=200-ghostY,len=sqrt(dx*dx+dy*dy);
  ghostX+=dx/len/3;  //移動X座標
  ghostY+=dy/len/3;  //移動Y座標
}

void mouseReleased()
{
  background(255);  //清背景
}
