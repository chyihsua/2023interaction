ArrayList<PVector>pt;  //大的資料結構ArrayList(可長可短的陣列)

void setup()
{
  size(400,400,P3D);
  pt=new ArrayList<PVector>();  //初始化 把大的資料結構準備好
}

void draw()
{
  background(#FFFFF2);
  pushMatrix();
    if (mousePressed && mouseButton==RIGHT)
    {
      //TRT 會旋轉
      translate(200,200);
      rotateY(radians(frameCount));
      translate(-200,-200);
    }
    for (PVector p:pt)
    {
      ellipse(p.x,p.y,10,10);  //畫小圓點
    }
    
    for (PVector p:pt)  //特殊的迴圈 會得到每一個小的資料結構
    {
      vertex(p.x,p.y);  //畫頂點 三點以上才成面
    }
    endShape();
   popMatrix();
}

void mousePressed()
{
  if (mouseButton==LEFT)
  {
    pt.add(new PVector (mouseX,mouseY));  //在大的資料結構裡加入小的資料結構物件PVector
  }
}
