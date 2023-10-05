void setup()
{
  size(400,400);
}

int [][]card=new int[8][11];  // 用陣列畫卡片
color [] C={#FF5555,#FFAA00,#55AA55,#5555FF};  //用陣列放每一格的顏色
void draw()
{
  background(255);
  for(int i=0;i<8;i++)
  {
    for (int j=0;j<11;j++)
    {
      drawCard(j*32,i*50,C[i%4]);  //呼叫畫卡函式
    }
  }
}

void drawCard(int x,int y,color c)  //畫卡函式
{
  stroke(128);  //灰線(邊緣)
  fill(255);  //白框
  rect(x,y,32,50,7);  //白框範圍 7是radius圓角
  noStroke();
  fill(c); 
  rect(x+3,y+3,32-5,50-5,4);  //中間有底色的區塊
}
