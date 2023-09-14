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
