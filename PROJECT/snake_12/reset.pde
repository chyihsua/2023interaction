void reset() {
  pt.clear();
  body.clear();
  body2.clear();
  body3.clear();
  body4.clear();
  body5.clear();
  rgb.clear();

  snakelen = 1;
  snakelen2 = 1;
  snakelen3 = 1;
  snakelen4 = 1;
  snakelen5 = 1;
  s = 1;
  snake = 0;
  speed = 5;
  mapSpeed = 1.5;
  sizeFood = 20;
  sizeSnake = 30;
  x = 250;
  y = 250;
  dir = 0;
  x2=random(300,1000);
  y2=random(300,1000);
  dir2=0;
  x3=random(1500,2000);
  y3=random(0,1000);
  dir3=0;
  x4=random(2000,3000);
  y4=random(500,800);
  dir4=0;
  x5=random(100,500);
  y5=random(200,800);
  dir5=0;
  
  status = 1;

  for (int i=0; i<1000; i++)
    pt.add(new PVector(random(-sizeX, 2*sizeX), random(-sizeY, 2*sizeY)));
  rgb.add(new PVector(random(255), random(255), random(255)));
}
