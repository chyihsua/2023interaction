void setup()
{
  size(400,400);
}

int [][]card=new int[8][11];  // 用陣列畫卡片
void draw()
{
  background(255);
  for(int i=0;i<8;i++)
  {
    for (int j=0;j<11;j++)
    {
      rect(j*32,i*50,32,50);
    }
  }
}
