PImage img3;
void gameOver()
{
  img3 = loadImage("gameover.png");
  img3.resize(1000,800);
  background(60);
  image(img3,0,0);
}
