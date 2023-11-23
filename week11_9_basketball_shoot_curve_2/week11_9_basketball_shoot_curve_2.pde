PImage imgRack;
void setup()
{
  size(700,700);
  imgRack=loadImage("rack.jpg");
}

void draw()
{
  background(255);
  image(imgRack,0,0);
  if (flying)  //飛行中
  {
    x+=vx;
    y+=vy;
    vy+=0.98;  //重力加速度
  }
  else  //不在飛行中
  {
    x=mouseX;
    y=mouseY;
    if (mousePressed)
    {
      fill(255);
      ellipse(posX,posY,20,20);
      line(posX,posY,x,y);
    }
  }
  //Anytime
  fill(#FFA652);
  ellipse(x,y,20,20);
}

boolean flying=false;
float x,y,vx,vy;
float posX=-100,posY=-100;

void mousePressed()
{
  x=posX=mouseX;
  y=posY=mouseY;
  flying=false;
}

void mouseReleased()  //放開開始飛行
{  
  vx=posX-mouseX;
  vy=posY-mouseY;
  flying=true;
}
