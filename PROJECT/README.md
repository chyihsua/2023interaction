# 貪吃蛇

## 參考資料：
[https://sites.google.com/view/funtoprogram/supplementary/processing/snake](
https://sites.google.com/view/funtoprogram/supplementary/processing/snake)

參考資料未實現：
- [X] 防止碰到邊界當機
- [ ] 無法從蛇的身體看清楚移動軌跡和方向>>>或許可以用透明度調整 折返過的身體部分顏色較深之類的 或是蛇頭本身顏色就不一樣
- [ ] 以圖片替代方塊著色的蛇身
- [ ] 主畫面設計
- [ ] 關卡選擇設計
- [ ] 關卡設計(class)
    - [X] 第一關
- [ ] 優化版面


## snake_1
###### Edit Time : 2023.
- 修改直、橫個字數 25=>50
- 修改畫布 500=>800
- 修改timer 30=>10
- 去除格線 no stroke()
- keyPressed()部分以if判斷替代原先switch()
- 新增上下左右鍵操控 keyCode==up,down,right,left


## snake_2
###### Edit Time : 2023.11.3
- 邊界錯誤修正
- 關卡加速 t
- Timer加入影響蛇行走速度
- 顯示Timer(簡單修改版面)
- 新增gameover() gamewin()


## snake_3
###### Edit Time : 2023.11.9~10



## snake_4
###### Edit Time : 2023.11.
- 用呼叫函式的方式切換場景
- 加入時間倒數顯示
- 重排版遊戲畫面

## 改變方向：隨意走動的貪吃蛇遊戲(小葉幫幫忙)
###### Edit Time : 2023.11.23(互動技術概論上課)
- [實現想像中亂走的貪吃蛇](https://www.youtube.com/watch?v=-8MFVtIlohI) 
- 用sin cos三角函數實現隨便可以轉動、移動的蛇

```
void setup()
{
  size(600,400);
}

float x=300,y=200,dir=0;
void draw()
{
  background(0);
  //畫一個小丑圖片
  joker(x,y,dir);  //dir角度
  //蛇移動 左右轉動
   x+=cos(dir);
   y+=sin(dir);
}

void joker(float x,float y,float dir)
{
  ellipse(x,y,50,50);
  line(x,y,x+25*cos(dir),y+25*sin(dir));  //25是原半徑 因為線從圓心出發
}

void keyPressed()
{
  //鍵盤控制左右移動
  if (keyCode==RIGHT)
  {
    dir+=0.1;
  }
  if (keyCode==LEFT)
  {
    dir-=0.1;
  }
}
```

- 殘影的方式讓蛇往前 =>座標要存陣列 
    - option1:用timer設限制更新dot.add(PVector)
    - option2:用for迴圈清除殘影
    - PROBLEM:PVector dir進不去=dir放z向量
    - 蛇身怎麼順暢的旋轉

## snake_5
###### Edit Time : 2023.11.24
- 關卡畫面設計
- 主畫面設計
- 關卡條件調整?

## snake_6
###### Time:2023.11.30（互動技術概論上課）
- 蛇移動身體的轉動方向和增長方向=>用for迴圈長身體、更新座標
- 小葉幫幫忙(示範) ：
```
//360度的貪食蛇
float x=250, y=250, dir=0, s=1;
int snakeLen = 1;
ArrayList<PVector> body = new ArrayList<PVector>();
void setup(){
  size(500,500);
  rectMode(CENTER);
}
void draw(){
  background(#FFFFF2);
  drawBody();
  drawHead(x, y, dir);
  x += s*cos(dir);
  y += s*sin(dir);
  if(body.size()<snakeLen*10){
    body.add( new PVector(x, y, dir) );
  }else{
    for(int i=0; i<body.size()-1; i++){
      body.get(i).x = body.get(i+1).x;
      body.get(i).y = body.get(i+1).y;
      body.get(i).z = body.get(i+1).z;
    }
    body.get(body.size()-1).x = x;
    body.get(body.size()-1).y = y;
    body.get(body.size()-1).z = dir;
  }
}
void drawBody(){
  for(int i=0; i<body.size(); i+=10){
    PVector b = body.get(i);
    ellipse(b.x, b.y, 30, 30);
    line(b.x, b.y, b.x-15*cos(b.z), b.y-15*sin(b.z) );
  }
}
void drawHead(float x, float y, float dir){
  ellipse(x, y, 30, 30);
  line(x, y, x+15*cos(dir), y+15*sin(dir) );
}
void keyPressed(){
  if(keyCode==LEFT) dir -= 0.15;
  if(keyCode==RIGHT) dir += 0.15;
  if(key==' ') {snakeLen ++; }
}
```

### snake_7
###### Time: 2023.12.2
- 修改程式碼讓蛇順暢移動、增長蛇身