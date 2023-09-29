void setup()
{
  size(500,500);
  colorMode(HSB,360,100,100);  //顏色模式：HSB,最大值：H:360度,S:100%.B:100%
}

void draw()
{
  background(frameCount%360,83,95);  //frameCount會從0~360循環
}
