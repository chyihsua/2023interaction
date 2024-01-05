PImage img2;
void stopGame()
{
  img2 = loadImage("stop.png");
  img2.resize(1000,800);
  background(60);
  image(img2,0,0);
  //textFont(myfont);
  //textSize(80);
  //textAlign(CENTER);
  //text("STOP", 500, 300);
  //textSize(30);
  //text("按s鍵繼續遊戲", 500, 450);
  if (key=='s') status=1;
}
