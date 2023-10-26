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
  stroke(0);  ellipse(200,200,15,15);  //ghost
  stroke(0);  ellipse(ghostX,ghostY,15,15);  //新增stroke顏色0，避免被後面程式更改
  strokeWeight(4);
  float dpx=0,dpy=0;  //累積移動量
  float rightdown=0;  //打勾前半段累積移動量
  float green_rightup=0;  //打勾後段累積移動量
  float rightup=0;
  float yellow_rightdown=0;
  
  boolean green_part1=false;  //用來判斷V ^差異  
  boolean green_ok=false;
  boolean yellow_part1=false;
  boolean yellow_ok=false;
  
  for (int i=0;i<pt.size()-1;i++)
  {
    PVector p=pt.get(i),p2=pt.get(i+1);
    line(p.x,p.y,p2.x,p2.y);
    dpx+=abs(p2.x-p.x);  //X累積移動量
    dpy+=abs(p2.y-p.y);  //累積Y移動量
    if (p2.x-p.x>0 && p2.y-p.y>0) rightdown+=sqrt(dpx*dpx+dpy*dpy);  //計算打勾的往右下座標
    if (green_part1 && p2.x-p.x>0 && p2.y-p.y<0) green_rightup+=sqrt(dpx*dpx+dpy*dpy);  //計算打勾的往右上座標
    if (p2.x-p.x>0 && p2.y-p.y<0) rightup+=sqrt(dpx*dpx+dpy*dpy);  //計算^
    if (yellow_part1 && p2.x-p.x>0 && p2.y-p.y>0) yellow_rightdown+=sqrt(dpx*dpx+dpy*dpy);
    
    if (green_part1==false && rightdown>150)  green_part1=true;
    else if (green_part1==true && green_rightup>150)  green_ok=true;
    if(yellow_part1==false && rightup>150)  yellow_part1=true;
    else if(yellow_part1==true && yellow_rightdown>150)  yellow_ok=true;
  }
  
  if(dpx>100 && dpy<40)  stroke(255,0,0);  //如果是橫線 改成紅色
  else if(dpx<40 && dpy>100)  stroke(0,0,255);  //如果是直線 改成藍色
  else if(green_ok)  stroke(0,255,0);  //如果是打勾 綠色
  else if(yellow_ok)  stroke(255,255,0);  //如果是^ 黃色
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
