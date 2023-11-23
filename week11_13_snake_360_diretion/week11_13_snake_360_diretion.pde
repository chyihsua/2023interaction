void setup()
{
  size(600,400);
}

float x=300,y=200,dir=0;
void draw()
{
  background(0);
  //畫一個小丑圖片
  joker(x,y,dir);  //dir角度
  //蛇移動 左右轉動
   x+=cos(dir);
   y+=sin(dir);
}

void joker(float x,float y,float dir)
{
  ellipse(x,y,50,50);
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
