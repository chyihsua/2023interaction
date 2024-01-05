PImage img3;
void gameOver()
{
  img3 = loadImage("gameover.png");
  img3.resize(1000,800);
  background(60);
  image(img3,0,0);
  //textFont(myfont);
  //textSize(80);
  //textAlign(CENTER);
  //text("GAMEOVER",500,300);
  //textSize(30);
  //text("請按r鍵重新開始",500,450);
}
