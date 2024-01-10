PImage img3;
void gameOver()
{
  gaming.stop();
  playgaming=false;
  if (playgameover==false) gameover.play();
  playgameover=true;
  img3 = loadImage("gameover.png");
  img3.resize(1000, 800);
  background(60);
  image(img3, 0, 0);
}
