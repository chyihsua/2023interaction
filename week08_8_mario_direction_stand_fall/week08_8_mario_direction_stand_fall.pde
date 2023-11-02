void setup()
{
  size(400, 400);
}
float marioX=50, marioY=250, vx=0, vy=0;

void draw()
{
  background(108, 137, 255);
  marioX+=vx;

  if (flying)
  {
    marioY+=vy;  //改變上下位置
    vy+=0.98;  //  重力加速度
    if (marioY>=250)  //碰到地板
    {
      //不再飛行
      marioY=250;
      flying=false;
    }
  }

  fill(255, 0, 0);  //天空
  ellipse(marioX, marioY, 15, 20);
  fill(229, 119, 42);  //地面
  rect(0, 260, 400, 150);
  fill(229,119,42);  //方塊
  rect(200,150,20,20);
  
  if (hitBox(200,150,20,20))
  {
    if(vy>0)
    {
      marioY=150-10;  //扣掉原點一半身長
      flying=false;
    }
    else
    {
      vy=0;
      marioY=150+20+10;  //加上箱子跟紅點高度
    }
  }
}

boolean hitBox(int x,int y,int w,int h)
{
  if (x-7<marioX && marioX<x+w+7 && y-10<marioY && marioY<y+h+10)  //加上物件長度才是正確偵測範圍
    return true;
  else return false;
}

boolean flying=false;  //預設沒在飛

void keyPressed()
{
  if (keyCode==RIGHT)  vx=2;
  if (keyCode==LEFT)  vx=-2;
  if (keyCode==UP && flying==false)
  {
    vy=-20;
    flying=true;
  }
}

void keyReleased()
{
  if (keyCode==RIGHT || keyCode==LEFT)  vx=0;
}
