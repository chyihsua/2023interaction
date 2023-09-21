PImage img;

void setup()
{
  size(600,600);
  img=loadImage("chair.jpg");
}

void draw()
{
  image(img,mouseX,mouseY,300,300); //圖片跟著滑鼠移動
}
