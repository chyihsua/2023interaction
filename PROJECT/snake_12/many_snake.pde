//新增蛇 mapMove() draw() eat() reset()要改

//每一隻蛇
//Snake5
ArrayList<PVector>body5=new ArrayList<PVector>();  //蛇3
int snakelen5=1;
//float x5=500, y5=250, dir5=200;
float x5=random(100,500),y5=random(200,800),dir5=0;

//遊戲中亂入的蛇（障礙）
void drawsnake5() {
  for (int i=0; i<body5.size(); i+=8) {
    PVector b5 = body5.get(i);
    noStroke();
    fill(random(150), random(100, 200), random(50));
    ellipse(b5.x, b5.y, 35, 35);
    line(b5.x, b5.y, b5.x-15*cos(b5.z), b5.y-15*sin(b5.z) );
  }

  // 改變方向
  dir5 += random(-0.2, 0.2);
  x5 += cos(dir5) * 0.6;
  y5 += sin(dir5) * 0.6;

  if (body5.size()<snakelen5*8) {
    body5.add(new PVector(x5, y5, dir5) );
  } else {
    for (int i=0; i<body5.size()-1; i++) {
      body5.get(i).x = body5.get(i+1).x;
      body5.get(i).y = body5.get(i+1).y;
      body5.get(i).z = body5.get(i+1).z;
    }
    body5.get(body5.size()-1).x = x5;
    body5.get(body5.size()-1).y = y5;
    body5.get(body5.size()-1).z = dir5;
  }
  eat(x5, y5, 5);
}

//Snake4
ArrayList<PVector>body4=new ArrayList<PVector>();  //蛇3
int snakelen4=1;
//float x4=500, y4=250, dir4=200;
float x4=random(2000,3000),y4=random(500,800),dir4=0;

//遊戲中亂入的蛇（障礙）
void drawsnake4() {
  for (int i=0; i<body4.size(); i+=8) {
    PVector b4 = body4.get(i);
    noStroke();
    fill(random(150), random(100,200), random(50));
    ellipse(b4.x, b4.y, 35, 35);
    line(b4.x, b4.y, b4.x-15*cos(b4.z), b4.y-15*sin(b4.z) );
  }

  // 改變方向
  dir4 += random(-0.2, 0.2);
  x4 += cos(dir4) * 0.8;
  y4 += sin(dir4) * 0.8;

  if (body4.size()<snakelen4*8) {
    body4.add(new PVector(x4, y4, dir4) );
  } else {
    for (int i=0; i<body4.size()-1; i++) {
      body4.get(i).x = body4.get(i+1).x;
      body4.get(i).y = body4.get(i+1).y;
      body4.get(i).z = body4.get(i+1).z;
    }
    body4.get(body4.size()-1).x = x4;
    body4.get(body4.size()-1).y = y4;
    body4.get(body4.size()-1).z = dir4;
  }
  eat(x4, y4, 4);
}

//Snake3
ArrayList<PVector>body3=new ArrayList<PVector>();  //蛇3
int snakelen3=1;
//float x3=350, y3=400, dir3=20;
float x3=random(1500,2000),y3=random(0,1000),dir3=0;

//遊戲中亂入的蛇（障礙）
void drawsnake3() {
  for (int i=0; i<body3.size(); i+=8) {
    PVector b3 = body3.get(i);
    noStroke();
    fill(random(255), random(100), random(50));
    ellipse(b3.x, b3.y, 35, 35);
    line(b3.x, b3.y, b3.x-15*cos(b3.z), b3.y-15*sin(b3.z) );
  }

  // 改變方向
  dir3 += random(-0.2, 0.2);
  x3 += cos(dir3) * 0.8;
  y3 += sin(dir3) * 0.8;

  if (body3.size()<snakelen3*8) {
    body3.add(new PVector(x3, y3, dir3) );
  } else {
    for (int i=0; i<body3.size()-1; i++) {
      body3.get(i).x = body3.get(i+1).x;
      body3.get(i).y = body3.get(i+1).y;
      body3.get(i).z = body3.get(i+1).z;
    }
    body3.get(body3.size()-1).x = x3;
    body3.get(body3.size()-1).y = y3;
    body3.get(body3.size()-1).z = dir3;
  }
  eat(x3, y3, 3);
}

//Snake2
ArrayList<PVector>body2=new ArrayList<PVector>();  //蛇2
int snakelen2=1;
//float x2=350, y2=400, dir2=0;
float x2=random(300,1000),y2=random(300,1000),dir2=0;

//遊戲中亂入的蛇（障礙）
void drawsnake2() {
  for (int i=0; i<body2.size(); i+=8) {
    PVector b2 = body2.get(i);
    noStroke();
    fill(random(150, 255), random(100), random(0,50));
    ellipse(b2.x, b2.y, 35, 35);
    line(b2.x, b2.y, b2.x-15*cos(b2.z), b2.y-15*sin(b2.z) );
  }

  // 改變方向
  dir2 += random(-0.2, 0.2);
  x2 += cos(dir2) * 0.6;
  y2 += sin(dir2) * 0.6;

  if (body2.size()<snakelen2*8) {
    body2.add(new PVector(x2, y2, dir2) );
  } else {
    for (int i=0; i<body2.size()-1; i++) {
      body2.get(i).x = body2.get(i+1).x;
      body2.get(i).y = body2.get(i+1).y;
      body2.get(i).z = body2.get(i+1).z;
    }
    body2.get(body2.size()-1).x = x2;
    body2.get(body2.size()-1).y = y2;
    body2.get(body2.size()-1).z = dir2;
  }
  eat(x2, y2, 2);
}


void hit() {
  //println(x,y);
  int min=body.size();
  int[] size={body.size(), body2.size(), body3.size(), body4.size(), body5.size()};
  println(size);
  for (int i=0; i<size.length; i++) {
    if (size[i]<min) min=size[i];
  }
  //if (body.size()>body2.size()|| body2.size()<body3.size())
  //  min=body2.size();
  //else if (body.size()>body3.size()|| body2.size()>body3.size())
  //  min=body3.size();
  //else min=body.size();
  for (int i=0; i<min-1; i++) {
    if (dist(x, y, body2.get(i).x, body2.get(i).y)<25 || dist(x, y, body3.get(i).x, body3.get(i).y)<25 || dist(x, y, body4.get(i).x, body4.get(i).y)<25 || dist(x, y, body5.get(i).x, body5.get(i).y)<25) { //IndexOutOfBoundsException: Index 16 out of bounds for length 16
      status=2;
      break;
    }
  }
}
