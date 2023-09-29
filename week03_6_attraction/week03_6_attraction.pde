void setup()
{
  size(500,500);
  for(int i=0;i<N;i++)
  {
    x[i]=random(500);
    y[i]=random(500);
    dx[i]=random(-1,+1);  //在-1到+1間取亂數決定移動方向
    dy[i]=random(-1,+1);  //在-1到+1間取亂數決定移動方向
  }
}
int N=40;
float []x=new float[N];  //點座標
float []y=new float[N];  //點座標
float []dx=new float[N]; //移動距離
float []dy=new float[N]; //移動距離

void draw()
{
  background(0);
  for(int i=0;i<N;i++)  
  {
    ellipse(x[i],y[i],5,5);  //畫圓
    for(int k=0;k<N;k++)  //另一個點
    {
      float d=dist(x[i],y[i],x[k],y[k]); //計算兩點的距離
      stroke(2.55*(100-d));  //如果距離近，顏色會越接近1白色，距離遠顏色越接近黑色
      if(d<100)  //如果兩點距離d<100
      { 
        line(x[i],y[i],x[k],y[k]);  //畫線
        dx[i]+=(x[k]-x[i])*0.00001;  //兩點連線後的拉扯感
        dy[i]+=(y[k]-y[i])*0.00001;  //兩點連線後的拉扯感
      }
    }
    x[i]+=dx[i]; 
    y[i]+=dy[i];
    if (x[i]<0||x[i]>500) dx[i]=-dx[i];  //如果座標要到視窗邊界，反彈
    if (y[i]<0||y[i]>500) dy[i]=-dy[i];  //如果座標要到視窗邊界，反彈
  }
 
}
