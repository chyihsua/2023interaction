void setup()
{
  size(400,400);
  myShuffle();
}

void myShuffle()
{
  for(int i=0;i<8;i++)
  {
    for(int j=0;j<11;j++)
    {
      cardN[i*11+j]=j;  //把卡片數字放到j
      cardC[i*11+j]=C[i%4];  //把卡片顏色放到C
    }
  }
  //做兩張牌交換
   int a=int(random(88)),b=int(random(88));
   //交換數字
   int temp=cardN[a];
   cardN[a]=cardN[b];
   cardN[b]=temp;
   //交換顏色
   temp=cardC[a];
   cardC[a]=cardC[b];
   cardC[b]=temp;
}

int [][]card=new int[8][11];  // 用陣列畫卡片
int []cardN=new int[88];  //  存卡片數字
int []cardC=new int[88];  //  存卡片顏色

color [] C={#FF5555,#FFAA00,#55AA55,#5555FF};  //用陣列放每一格的顏色
void draw()
{
  background(255);
  for(int i=0;i<8;i++)
  {
    for (int j=0;j<11;j++)
    {
      //drawCard(j*32,i*50,C[i%4],j);  //呼叫畫卡函式
      drawCard(j*32,i*50,cardC[i*11+j],cardN[i*11+j]);
    }
  }
}

void drawCard(int x,int y,color c,int n)  //畫卡函式
{
  stroke(128);  //灰線(邊緣)
  fill(255);  //白框
  rect(x,y,32,50,7);  //白框範圍 7是radius圓角
  noStroke();
  fill(c); 
  rect(x+3,y+3,32-5,50-5,4);  //中間有底色的區塊
  
  //畫橢圓
  pushMatrix();
  fill(255);  //白色
  translate(x+16,y+25);  //調整位子
  rotate(radians(45));  //旋轉
  ellipse(0,0,20,30);  //畫橢圓
  popMatrix();
  
  //卡排左上號碼
  textSize(10);
  textAlign(CENTER,CENTER);
  text(n,x+7,y+7);
  
  //卡排中間號碼
  textSize(20);
  fill(c);  //  指定顏色避免顯示不出來
  text(n,x+16,y+21);
}
