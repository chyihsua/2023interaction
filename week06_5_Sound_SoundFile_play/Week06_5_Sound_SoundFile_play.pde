import processing.sound.*;

SoundFile file;
void setup()
{
  size(300,300);
  file=new SoundFile(this,"How Far Should I Go.mp3");
  file.play();
}

void draw()  //不可省略 不然會沒聲音
{

}
