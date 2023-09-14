// 互動模式 Interactive Mode(Active Mode)
void setup()
{
   size(500,500);
   background(255,255,255);
}

void draw()
{
   if(mousePressed) 
   {//如果滑鼠按下去
     line(mouseX,mouseY,pmouseX,pmouseY);  
      //畫線(滑鼠座標mouseX mouseY到之前的滑鼠座標mouseX mouseY)
   }
}

int w=1;
void keyPressed()
{
   if(key=='1') stroke(255,0,0);  //更改畫筆顏色
   if(key=='2') stroke(0,255,0);
   if(key=='3') stroke(0,0,255);
   if(key=='+') strokeWeight(++w);
   if(key=='-') strokeWeight(--w);
   println(w);
}
