void setup()
{
  size(300,300);
  colorMode(HSB,360,100,100);
  chooseColor();  //呼叫函數
}

void mousePressed()
{
  chooseColor();  //每次按下滑鼠的時候呼叫chooseColor
}

int I,J;
float h,s,b,dh,ds,db;  //ds,dh,db差一點的顏色值
void chooseColor() //隨機挑一個顏色
{
  h=random(360);
  s=random(50,100);  //設定範圍
  b=random(50,100);  //設定範圍
  I=int(random(5));
  J=int(random(5));
  dh=random(-10,10);
  ds=random(-10,10);
  db=random(-10,10);
}
void draw()
{
  background(244,74,82);
  for(int i=0;i<5;i++)
  {
    for(int j=0;j<5;j++)
    {
      if(i==I&&j==J) fill(h+dh,s+ds,b+db);
      else fill(h,s,b);  //填入隨機產生出來的顏色
      ellipse(30+j*60,30+i*60,60,60);   //畫圓
    }
  }
}
