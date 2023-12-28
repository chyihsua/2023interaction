void reset() {
  pt.clear();
  body.clear();
  body2.clear();
  rgb.clear();

  snakelen = 1;
  snakelen2 = 1;
  s = 1;
  snake = 0;
  speed = 5;
  mapSpeed = 1.5;
  sizeFood = 20;
  sizeSnake = 30;
  x = 250;
  y = 250;
  dir = 0;
  x2 = 350;
  y2 = 400;
  dir2 = 0;
  status = 1;

  for (int i=0; i<1000; i++)
    pt.add(new PVector(random(-sizeX, 2*sizeX), random(-sizeY, 2*sizeY)));
  rgb.add(new PVector(random(255), random(255), random(255)));
}
