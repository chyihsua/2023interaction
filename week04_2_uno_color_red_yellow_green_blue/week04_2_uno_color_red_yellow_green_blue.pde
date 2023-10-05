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
      fill(C[i%4]);  //用儲存好的顏色陣列填色
      rect(j*32,i*50,32,50);
    }
  }
}
