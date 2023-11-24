ArrayList<PVector>pt;  //食物的點
ArrayList<PVector>dot;

int n=0;

void setup()
{
  size(600,400);
  //隨機產生20個代表食物的座標
  pt=new ArrayList<PVector>();
  dot=new ArrayList<PVector>();
  for(int i=0;i<20;i++)
  {
    pt.add(new PVector(random(600),random(400)));
    print(pt);
  }
  
  if (n!=0)
  {
    dot.add(new PVector)
  }
}

float x=300,y=200,dir=0;  //dir角度

void draw()
{
  background(0);
  
  //畫食物
  for (PVector p:pt)
  {
    fill(255,255,0);
    ellipse(p.x,p.y,10,10);
  }
  
  //畫蛇頭
  head(x,y,dir);  
  
  //蛇移動 左右轉動
   x+=cos(dir);
   y+=sin(dir);
}

void head(float x,float y,float dir)
{
  fill(255);
  ellipse(x,y,30,30);
  line(x,y,x+25*cos(dir),y+25*sin(dir));  //25是原半徑 因為線從圓心出發
}



void keyPressed()
{
  //鍵盤控制左右移動
  if (keyCode==RIGHT)
  {
    dir+=0.1;
  }
  if (keyCode==LEFT)
  {
    dir-=0.1;
  }
}
