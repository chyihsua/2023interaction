void setup()
{
  size(500,500);
  dx=random(-1,+1);  //在-1到+1間取亂數決定移動方向
  dy=random(-1,+1);  //在-1到+1間取亂數決定移動方向
}

float x=250,y=250;
float dx=1,dy=1;

void draw()
{
  background(0);
  ellipse(x,y,5,5);  //畫圓
  x+=dx; 
  y+=dy;
  if (x<0||x>500) dx=-dx;  //如果座標要到視窗邊界，反彈
  if (y<0||y>500) dy=-dy;  //如果座標要到視窗邊界，反彈
}
