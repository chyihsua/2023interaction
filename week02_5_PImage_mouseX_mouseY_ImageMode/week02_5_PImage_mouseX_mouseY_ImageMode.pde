PImage img,img2;

void setup()
{
  size(600,600);
  img=loadImage("PHOTO.png"); //仙杜瑞拉
  img2=loadImage("img2.PNG"); ///視窗
}

void draw()
{
  imageMode(CENTER);
  if (mousePressed)
  {
    image(img2,mouseX,mouseY);
  }
  else
  {
    image(img,300,300,220,300); //圖片跟著滑鼠移動
  }
}
