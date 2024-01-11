//每一隻蛇
class Snake {
  ArrayList<PVector> body;
  int snakelen;
  float x, y, dir;

  Snake(float x, float y) {
    this.body = new ArrayList<PVector>();
    this.snakelen = 1;
    this.x = x;
    this.y = y;
    this.dir = 0;
  }

  void reset(float x, float y) {
    body.clear();
    snakelen=1;
    dir=0;
    x=x;
    y=y;
  }

  void drawsnake() {
    for (int i = 0; i < body.size(); i += 8) {
      PVector b = body.get(i);
      noStroke();
      fill(random(200, 255), random(100, 200), random(100, 200));
      ellipse(b.x, b.y, 35, 35);
      line(b.x, b.y, b.x - 15 * cos(b.z), b.y - 15 * sin(b.z));
    }

    // 改變方向
    dir += random(-0.2, 0.2);
    x += cos(dir) * 0.6;
    y += sin(dir) * 0.6;

    if (body.size() < snakelen * 8) {
      body.add(new PVector(x, y, dir));
    } else {
      for (int i = 0; i < body.size() - 1; i++) {
        body.get(i).x = body.get(i + 1).x;
        body.get(i).y = body.get(i + 1).y;
        body.get(i).z = body.get(i + 1).z;
      }
      body.get(body.size() - 1).x = x;
      body.get(body.size() - 1).y = y;
      body.get(body.size() - 1).z = dir;
    }
    eat(x, y);

    //碰到邊界消失重置
    if (this.x < sizeX || this.x > sizeX + 3000 || this.y < sizeY || this.y > sizeY + 2400) {
      this.reset(random(sizeX, sizeX + 3000), random(sizeY, sizeY + 2400));
    }
  }

  void eat(float x, float y) {
    for (PVector p : pt) {
      if (p.x <= x + sizeSnake / 2 && p.x >= x - sizeSnake / 2 && p.y <= y + sizeSnake / 2 && p.y >= y - sizeSnake / 2) {
        snakelen++;
        p.x = random(sizeX, sizeX + 3000);
        p.y = random(sizeY, sizeY + 2400);
        rgb.add(new PVector(random(255), random(255), random(255)));
      }
    }
  }

  void moveBody(float dx, float dy) {
    for (PVector b : body) {
      b.x += dx;
      b.y += dy;
    }
  }

  boolean check(float x, float y) {
  for (int i = 0; i < body.size(); i++) {
    if (dist(x, y, body.get(i).x, body.get(i).y) < 25) {
      return true;
    }
  }
  return false;
}
}

Snake snake2 = new Snake(random(300, 1000), random(300, 1000));
Snake snake3 = new Snake(random(1500, 2000), random(0, 1000));
Snake snake4 = new Snake(random(2000, 3000), random(500, 800));
Snake snake5 = new Snake(random(100, 500), random(200, 800));

void hit() {
  if (snake2.check(x, y) || snake3.check(x, y) || snake4.check(x, y) || snake5.check(x, y)) {
    status=2;
  }

  if (x<=sizeX+sizeSnake/5 || y<=sizeY+sizeSnake/5 || x>=sizeX+3000-sizeSnake/5 || y>=sizeY+2400-sizeSnake/5) {
    status=2;
  }
}
