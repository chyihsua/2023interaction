void setup()
{
  size(400,400,P3D);  //P3D開啟3D功能
}

void draw()
{
  background(#FFFFF2);
  pushMatrix();
    translate(mouseX,mouseY);
    box(100);  //大小100的3D方塊
  popMatrix();
}
