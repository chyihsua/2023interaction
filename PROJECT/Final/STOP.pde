PImage img2;
void stopGame()
{
  img2 = loadImage("stop.png");
  img2.resize(1000, 800);
  background(60);
  image(img2, 0, 0);
  if (key=='s') status=1;
}
