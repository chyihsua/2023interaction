void setup()
{
  size(500,500);
  for(int i=0;i<20;i++)
  {
    x[i]=random(500);
    y[i]=random(500);
    dx[i]=random(-1,+1);  //在-1到+1間取亂數決定移動方向
    dy[i]=random(-1,+1);  //在-1到+1間取亂數決定移動方向
  }
}

float []x=new float[20];  //點座標
float []y=new float[20];  //點座標
float []dx=new float[20]; //移動距離
float []dy=new float[20]; //移動距離

void draw()
{
  background(0);
  for(int i=0;i<20;i++)  
  {
    ellipse(x[i],y[i],5,5);  //畫圓
    for(int k=0;k<20;k++)  //另一個點
    {
      stroke(255,0,0);
      if(dist(x[i],y[i],x[k],y[k])<100)  //如果兩點距離<100
        line(x[i],y[i],x[k],y[k]);  //畫線
    }
    x[i]+=dx[i]; 
    y[i]+=dy[i];
    if (x[i]<0||x[i]>500) dx[i]=-dx[i];  //如果座標要到視窗邊界，反彈
    if (y[i]<0||y[i]>500) dy[i]=-dy[i];  //如果座標要到視窗邊界，反彈
  }
 
}
