import processing.sound.*;
SoundFile start, welcome, eat, gameover,gaming;
ArrayList<PVector>pt=new ArrayList<PVector>();  //食物的點
ArrayList<PVector>body=new ArrayList<PVector>();  //蛇身
ArrayList<PVector>rgb = new ArrayList<PVector>();  //改變身體顏色
int snakelen = 1;
int s=1;
int snake=1;
float sizeX=-1000, sizeY=-800;
int speed=5;
float mapSpeed=1.5;
float sizeFood=20, sizeSnake=30;
float x=250, y=250, dir=0;
float dx, dy, d;
int status=0;
boolean glow=true;
float glowSize=1.25;
int time=0;
boolean playstart=false,playwelcome=false,playeat=false,playgameover=false,playgaming=false;

void setup() {
  size(1000, 800);
  welcome = new SoundFile(this, "game.mp3");
  start = new SoundFile(this, "startGame.mp3");
  eat = new SoundFile(this, "eat.mp3");
  gameover = new SoundFile(this, "gameOver.mp3");
  gaming = new SoundFile(this, "gaming.mp3");
  for (int i=0; i<1000; i++)
    pt.add(new PVector(random(sizeX, sizeX+3000), random(sizeY, sizeY+2400)));
  rgb.add(new PVector(random(255), random(255), random(255)));
}

void draw()
{
  if (status==0) welcome();
  if (status==1)
  {
    if (playwelcome==true) {
      welcome.stop();
      playwelcome=false;
    }
    if (playstart==true) {
      start.stop();
      playstart=false;
    }
    if(playgaming==false) gaming.play();
    playgaming=true;
    background(0);
    drawmap();
    fill(255);
    dx = mouseX-x;
    dy = mouseY-y;
    d = sqrt(dx * dx + dy * dy)*3;
    stroke(0);
    snake2.drawsnake();
    snake3.drawsnake();
    snake4.drawsnake();
    snake5.drawsnake();
    drawbody();
    drawhead(x, y, dir);
    move();
    
    eat(x, y, 1);
    
    mapMove();
    hit();
  }
  if (status==2) {
    gameOver();
  }
  if (status==4) {
    stopGame();
  }
}

//限制畫布範圍
void drawmap() {
  fill(60);
  stroke(255, 0, 0);
  strokeWeight(10);
  rect(sizeX, sizeY, 3000, 2400);
  stroke(75);
  strokeWeight(2);
  for (int i=50; i<2400; i+=50) line(sizeX, sizeY+i, sizeX+3000, sizeY+i);
  for (int i=50; i<3000; i+=50) line(sizeX+i, sizeY, sizeX+i, sizeY+2400);

  time+=1;
  if (glowSize<1.65 && glow && time==4) glowSize+=0.05;
  if (glowSize>=1.65) glow=false;
  if (glowSize>1.25 && !glow && time==4) glowSize-=0.05;
  if (glowSize<=1.25) glow=true;
  if (time==4) time=0;

  for (PVector p : pt) {
    noStroke();
    fill(255, 255, 0, 100);
    ellipse(p.x, p.y, sizeFood*glowSize, sizeFood*glowSize);
    fill(255, 255, 0);
    ellipse(p.x, p.y, sizeFood, sizeFood);
    fill(225, 255, 0);
    ellipse(p.x, p.y, sizeFood*0.7, sizeFood*0.7);
  }

  for (int i = pt.size() - 1; i >= 0; i--) {
    PVector p = pt.get(i);
    if (p.x < sizeX || p.x > sizeX + 3000 || p.y < sizeY || p.y > sizeY + 2400) {
      pt.remove(i);
      p.x=random(sizeX, sizeX+3000);
      p.y=random(sizeY, sizeY+2400);
      rgb.add(new PVector(random(255), random(255), random(255)));
    }
  }
}

//畫布移動
void mapMove() {
  float sx = 0.0, sy = 0.0;

  if (x < 100) {
    x = 100;
    sizeX += mapSpeed;
    sx = mapSpeed;
  } else if (x > 900) {
    x = 900;
    sizeX -= mapSpeed;
    sx = -mapSpeed;
  }

  if (y < 100) {
    y = 100;
    sizeY += mapSpeed;
    sy = mapSpeed;
  } else if (y > 700) {
    y = 700;
    sizeY -= mapSpeed;
    sy = -mapSpeed;
  }

  for (PVector p : pt) {
    p.x += sx;
    p.y += sy;
  }

  for (PVector b : body) {
    b.x += sx;
    b.y += sy;
  }
  snake2.moveBody(sx, sy);
  snake3.moveBody(sx, sy);
  snake4.moveBody(sx, sy);
  snake5.moveBody(sx, sy);
}

void drawbody() {
  int j=0;
  for (int i=0; i<body.size(); i+=8) {
    PVector b = body.get(i);
    noStroke();
    fill(rgb.get(j).x, rgb.get(j).y, rgb.get(j).z);
    ellipse(b.x, b.y, sizeSnake, sizeSnake);
    line(b.x, b.y, b.x-15*cos(b.z), b.y-15*sin(b.z) );
    j+=1;
  }
}

void drawhead(float x, float y, float dir) {
  noStroke();
  ellipse(x, y, sizeSnake, sizeSnake);
  line(x, y, x+15*cos(dir), y+15*sin(dir));
  fill(255);
}

//移動
void move() {
  if (dist(mouseX, mouseY, x, y)<20) {
    x+=1*cos(dir);
    y+=1*sin(dir);
    dir+=0.1;
  } else {
    x += dx / d*speed;
    y += dy / d*speed;
  }
  if (body.size()<snakelen*8) {
    body.add( new PVector(x, y, dir) );
    if (sizeFood>5) sizeFood-=0.01;
    sizeSnake+=0.1;
  } else {
    for (int i=0; i<body.size()-1; i++) {
      body.get(i).x = body.get(i+1).x;
      body.get(i).y = body.get(i+1).y;
      body.get(i).z = body.get(i+1).z;
    }
    body.get(body.size()-1).x = x;
    body.get(body.size()-1).y = y;
    body.get(body.size()-1).z = dir;
  }
}

//吃到食物偵測
void eat(float x, float y, int snake) {
  for (PVector p : pt) {
    if (p.x<=x+sizeSnake/2 && p.x>=x-sizeSnake/2 && p.y<=y+sizeSnake/2 && p.y>=y-sizeSnake/2) {
      if (snake==1){
        eat.play();
        snakelen++;
      }
      else if (snake==2)
        snake2.eat(x, y);
      else if (snake==3)
        snake3.eat(x, y);
      else if (snake==4)
        snake4.eat(x, y);
      else if (snake==5)
        snake5.eat(x, y);
      p.x=random(sizeX, sizeX+3000);
      p.y=random(sizeY, sizeY+2400);
      rgb.add(new PVector(random(255), random(255), random(255)));
    }
  }
}

void keyPressed() {
  if (key=='s') status=1;
  if (status==1 && key==' ') status=4;
  if (status==2 && key=='r') {
    if (playgameover==true) gameover.stop();
    if (playstart==false) start.play();
    playstart=true;
    reset();
  }
}

void keyReleased() {
  key='>';  //隨便丟一個未使用的值做初始化
}

void mousePressed() {
  speed=8;
  mapSpeed=2.5;
}

void mouseReleased() {
  speed=5;
  mapSpeed=1.5;
}
