PImage img1;
void welcome()
{
  if (playwelcome==false) welcome.play();
  playwelcome=true;
  img1 = loadImage("main.png");
  img1.resize(1000, 800);
  background(60);
  stroke(75);
  strokeWeight(2);
  for (int i=50; i<2400; i+=50) line(sizeX, sizeY+i, sizeX+3000, sizeY+i);
  for (int i=50; i<3000; i+=50) line(sizeX+i, sizeY, sizeX+i, sizeY+2400);
  image(img1, 0, 0);
}
