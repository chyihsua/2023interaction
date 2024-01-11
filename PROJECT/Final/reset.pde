void reset() {
  pt.clear();
  body.clear();
  rgb.clear();
  snake2.reset(random(300, 1000), random(300, 1000));
  snake3.reset(random(1500, 2000), random(0, 1000));
  snake4.reset(random(2000, 3000), random(500, 800));
  snake5.reset(random(100, 500), random(200, 800));
  snakelen = 1;
  s = 1;
  snake = 0;
  speed = 5;
  mapSpeed = 1.5;
  sizeFood = 20;
  sizeSnake = 30;
  sizeX=-1000;
  sizeY=-800;
  x = 250;
  y = 250;
  dir = 0;
  status = 1;
  playstart=false;
  playwelcome=false;
  playeat=false;
  playgameover=false;
  playgaming=false;
  for (int i=0; i<1000; i++)
    pt.add(new PVector(random(sizeX, sizeX+3000), random(sizeY, sizeY+2400)));
  rgb.add(new PVector(random(255), random(255), random(255)));
}
