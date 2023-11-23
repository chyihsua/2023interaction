void setup()
{
  size(600,500);
  //產生亂數
  for(int i=0;i<4;i++)
  {
    for(int j=0;j<6;j++)
    {
      value[i][j]=i*6+j+10;  //從10開始，數字不重複
    }
  }
  //交換
  for(int k=0;k<200;k++)  //交換次數
  {
    //產生亂數放入
    int i1=int(random(4)),i2=int(random(4));
    int j1=int(random(6)),j2=int(random(6));
    int temp=value[i1][j1];
    value[i1][j1]=value[i2][j2];
    value[i2][j2]=value[i1][j1];
  }
}


int [][]value=new int [4][6];

void draw()
{
  background(255);
  for(int i=0;i<4;i++)
  {
     for(int j=0;j<6;j++)
     {
       //畫矩陣
       fill(#F5B4B4);
       rect(j*100,i*100,100,100);
       //顯示文字在方格內
       fill(0);
       text(value[i][j],j*100+25,i*100+50);
     }
  }
}
