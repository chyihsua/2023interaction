PImage img1;
void welcome()
{
  img1 = loadImage("main.png");
  img1.resize(1000,800);
  background(60);
  stroke(75);
  strokeWeight(2);
  for(int i=50; i<2400; i+=50) line(sizeX, sizeY+i, sizeX+3000, sizeY+i);
  for(int i=50; i<3000; i+=50) line(sizeX+i, sizeY, sizeX+i, sizeY+2400);
  image(img1,0,0);
  //textFont(myfont);
  //textSize(80);
  //textAlign(CENTER);
  //text("貪吃蛇",500,300);
  //textSize(30);
  //text("請按s鍵開始遊戲",500,450);
}
