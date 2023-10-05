void setup()
{
  size(800,800);
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
  
  //洗牌
  for(int i=0;i<1000;i++)  //i<?自訂要洗幾次\
  {
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
}

int [][]card=new int[8][11];  // 用陣列畫卡片
int []cardN=new int[88];  //  存卡片數字
int []cardC=new int[88];  //  存卡片顏色

color [] C={#FF5555,#FFAA00,#55AA55,#5555FF};  //用陣列放每一格的顏色
void draw()
{
  background(255);
  if (mousePressed && mouseButton==RIGHT)  //顯示所有牌
  {
    for(int i=0;i<8;i++)
    {
      for (int j=0;j<11;j++)
      {
        drawCard(j*32,i*50,cardC[i*11+j],cardN[i*11+j],32);
      }
    }
  }
  else drawCard(50,50,#000000,99,128);  //得到卡片
  for (int i=0;i<myCard;i++)  //呼叫drawCard顯示已經洗好的牌
  {
    if (i%4==0)  drawCard(450      +40*i,50,cardC[i],cardN[i],128);
    if (i%4==1)  drawCard(450-40   +40*i,350,cardC[i],cardN[i],128);
    if (i%4==2)  drawCard(450-80   +40*i,650,cardC[i],cardN[i],128);
    if (i%4==3)  drawCard(450-120  +40*i,350,cardC[i],cardN[i],128);
  }
}

int myCard=0;
void mousePressed()
{
  if (mouseButton==LEFT) 
    myCard++;  //按下左鍵拿牌
}

void drawCard(int x,int y,color c,int n,int w)  //畫卡函式
{
  float s=w/32.0;  //縮放倍率
  stroke(128);  //灰線(邊緣)
  fill(255);  //白框
  rect(x,y,32*s,50*s,7*s);  //白框範圍 7是radius圓角
  noStroke();
  fill(c); 
  rect(x+2.5*s,y+2.5*s,32*s-5*s,50*s-5*s,5*s);  //中間有底色的區塊
  
  //畫橢圓
  pushMatrix();
  fill(255);  //白色
  translate(x+16*s,y+25*s);  //調整位子
  rotate(radians(45));  //旋轉
  ellipse(0,0,20*s,30*s);  //畫橢圓
  popMatrix();
  
  //卡排左上號碼
  textSize(10*s);
  textAlign(CENTER,CENTER);
  text(n,x+7*s,y+7*s);
  
  //卡排中間號碼
  textSize(20*s);
  fill(c);  //  指定顏色避免顯示不出來
  text(n,x+16*s,y+21*s);
}
