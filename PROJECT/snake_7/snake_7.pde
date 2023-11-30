ArrayList<PVector>pt;  //食物的點
ArrayList<PVector>body=new ArrayList<PVector>();

int snakelen = 1;
int s=1;

void setup()
{
  size(600, 400);
  //隨機產生20個代表食物的座標
  pt=new ArrayList<PVector>();
  for (int i=0; i<20; i++)
  {
    pt.add(new PVector(random(600), random(400)));
  }
}

float x=300, y=200, dir=0;  //dir角度

void draw()
{
  background(0);

  //畫食物
  for (PVector p : pt)
  {
    fill(255, 255, 0);
    ellipse(p.x, p.y, 10, 10);
  }

  //畫蛇
  drawbody();
  drawhead(x, y, dir);

  //蛇移動
  move();
}

void drawhead(float x, float y, float dir) {
  ellipse(x, y, 30, 30);
  line(x, y, x-15*cos(dir), y-15*sin(dir));
}

void drawbody() {
  for (int i=0; i<body.size(); i+=10) {
    PVector b = body.get(i);
    fill(255);
    ellipse(b.x, b.y, 30, 30);
    line(b.x, b.y, b.x+15*cos(b.z), b.y+15*sin(b.z));
  }
}

void move() {
  //當蛇身<10時加點（因為蛇身設定10px加一個身體）
  if (body.size()<snakelen*10) {
    body.add(new PVector(x, y, dir));
  } 
  else {
    //更新蛇身座標：往前一格
    for (int i=body.size()-1; i>0; i--) {
      body.get(i).x = body.get(i-1).x;
      body.get(i).y = body.get(i-1).y;
      body.get(i).z = body.get(i-1).z;
    }
  }
  
  //更新蛇頭座標
  PVector b = body.get(0);
  x+=s*cos(dir);
  y+=s*sin(dir);
  b.x = x;
  b.y = y;
  b.z = dir;
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
  if (keyCode == UP) {
    snakelen++;
  }
}
