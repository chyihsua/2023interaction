PImage img;

void setup()
{
  size(800,600);
  img=loadImage("keyboard.png");
  rectMode(CENTER);  //用對齊中心畫
}

void draw()
{
  background(#FFFFF2);  //用淡黃色清理背景
  image(img,0,600-266);  //貼齊正下方
  fill(255,0,0,128);  //最後數值為透明度
  rect(mouseX,mouseY,28,30,5);  //調整成跟鍵盤按鈕一樣的大小
}

void mousePressed()
{
  print(mouseX,mouseY);  //按下時印出座標
}
