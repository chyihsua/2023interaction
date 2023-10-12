void setup()
{
  size(400,400,P3D);  //P3D開啟3D功能
}

void draw()
{
  background(#FFFFF2);
  pushMatrix();
    translate(mouseX,mouseY);
    rotateY(radians(mouseX));  //對Y軸轉動
    fill(0,255,0);  //綠色的面
    box(100);  //大小100的3D方塊
    
    noFill();  //面不填充
    scale(2);  //放大兩倍
    box(100);
  popMatrix();
}
