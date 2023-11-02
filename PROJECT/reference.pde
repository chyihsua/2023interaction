int n=25;  //橫排格子數
int m=25;  //直排格子數
int cw ;  //格子寬度
int ch;  //格子高度
int[] map;  //食物在地圖的位置
int[] snakex = new int[100];  //蛇x位置 長度上限100
int[] snakey= new int[100];  //蛇y位置
int snakesize=1;  //蛇大小
int timer =0;  //移動速率
int direction=0;  //移動方向


void setup()
{
  size(500, 500);
  cw= width/n;  //計算格子寬度
  ch=height/m;  //高度
  map = new int[n*m];  //宣告map大小是n*m
  
  //初始化食物矩陣
  for (int i=0; i < n*m; i++)
  {
    map[i]= 0; 
  }
  
  //隨機產生一個食物在n*m範圍內
  int food = (int)random(n*m);
  map[food]=1;
  
  //初始化蛇的位子>隨機產生位置
  snakex[0]= (int)random(n);
  snakey[0]= (int)random(m);
}


void draw()
{
  drawmap();
  drawsnake();
  timer++;
  if (( timer %30)==0)
  {
    move();
    check();

    timer =0;
  }
}


void check()
{
  int newposx = snakex[0];  //新的蛇座標預設在起點
  int newposy = snakey[0];  //新的蛇座標預設在起點
  
  //吃到食物的程式 一維矩陣map()
  if (map[newposy*n+ newposx] ==1)
  {
    map[newposy*n+ newposx]=0;
    int food = (int)random(n*m);
    map[food]=1;
    snakesize++;
    
    for (int i = snakesize-1; i>0; i--)
    {
      snakex[i]=snakex[i-1];
      snakey[i]=snakey[i-1];
    }
  }
}


//設定鍵盤控制上下左右移動 w s a d
void keyPressed()
{
  char c=key;
  
  //條件判斷鍵盤控制
  switch(c)
  {
    case 'a':
      direction =0;
      break;
    case 'd':
      direction =3;
      break;
    case 'w':
      direction =1;
      break;
    case 's':
      direction =2;
      break;
  }
}


void move()
{
  for(int i=snakesize-1;i>0;i--)
  {
    snakex[i]=snakex[i-1];
    snakey[i]=snakey[i-1];
  }
  
  int newposx=snakex[0];
  int newposy=snakey[0];
  
  switch(direction)
  {
    case 0:
      newposx--;
      break;
    case 1:
      newposy--;
      break;
    case 2:
      newposy++;
      break;
    case 3:
      newposx++;
      break;
  }
  
  snakex[0]=newposx;
  snakey[0]=newposy;
}


void drawmap() {
  int count =0;
  for(int j=0;j<m;j++)
  {
    for(int i=0;i<n;i++)
    {
      if(map[count]==1)
      {
        fill(255, 0, 0);
      } 
      else fill(255);
      rect( i*cw, j*ch, cw, ch);
      count++;
    }
  }
}


void drawsnake() 
{
  fill(0, 0, 255);
  for ( int i = 0; i < snakesize; i++)
  {
    int posx = snakex[i];
    int posy = snakey[i];
    rect(posx*cw, posy*ch, cw, ch);
  }
}
