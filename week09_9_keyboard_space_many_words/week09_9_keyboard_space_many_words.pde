PImage img;
//宣告二微陣列放A~Z座標(使用notepad++)
int [][]pos={{94,491},{246,525},{179,524},{160,491},{152,457},{196,491},{230,491},{264,491},{322,457},{298,491},{333,490},{367,490},{314,525},{281,524},{358,456},{391,457},{84,456},{187,457},{126,490},{220,457},{287,457},{213,524},{118,457},{144,524},{253,456},{109,525}};

void setup()
{
  size(800,600);
  img=loadImage("keyboard.png");
  rectMode(CENTER);  //用對齊中心畫
}

void draw()
{
  background(#FFFFF2);  //用淡黃色清理背景
  image(img,0,600-266);  //貼齊正下方
  fill(255,0,0,128);  //最後數值為透明度
  rect(mouseX,mouseY,28,30,5);  //調整成跟鍵盤按鈕一樣的大小
  fill(0,255,0,128);
  for(int i=0;i<26;i++)
  {
    if(ID<typing.length() && typing.charAt(0)-'a'==i)  rect(pos[i][0],pos[i][1],28,30,5);  //顯示現在要打的字母位置
    if (pressed[i])
    {
      rect(pos[i][0],pos[i][1],28,30,5);  //pos[i][0] x座標 pos[i][1] y座標
    }
  }
  fill(0);  //字顏色
  textSize(50);
  text(typing,50,50);  //要打的字
  fill(255,0,0);
  if (ID<typing.length())  text(typed +typing.charAt(ID),50,100);//要打的字 利用typing.charAt(0)
  fill(0); 
  text(typed,50,100);  //已經打的字
}

String typing="printf is a function";
String typed="";  //打了幾個字
int ID=0;  //記錄第幾個字要被打

boolean [] pressed=new boolean[26];  //java的陣列宣告，都是0或false
void keyPressed()
{
  if (ID<typing.length() && key==typing.charAt(ID))  //如果打對字 
  {
    if (key>='a' && key<='z') 
    {
      pressed[key-'a']=true;  //如果按下小寫按鍵，顯示相對應按鍵 
      typed+=key;  //把按下的字記錄到typed中
      ID++;
    }
    else if (key==' ')
    {
      typed+=key;  //把按下的字記錄到typed中
      ID++;
    }
    else background(255,0,0);  //如果打錯 畫面閃一下
  }
}

void keyReleased()
{
  if (key>='a' && key<='z')  pressed[key-'a']=false;  //如果放開小寫按鍵，取消顯示相對應按鍵
  
}
