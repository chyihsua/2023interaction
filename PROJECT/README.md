# 貪吃蛇

## 參考資料：
[https://sites.google.com/view/funtoprogram/supplementary/processing/snake](
https://sites.google.com/view/funtoprogram/supplementary/processing/snake)

參考資料未實現：
- [X] 防止碰到邊界當機
- [X] 無法從蛇的身體看清楚移動軌跡和方向>>>或許可以用透明度調整 折返過的身體部分顏色較深之類的 或是蛇頭本身顏色就不一樣
- [X] 主畫面設計
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
###### Edit Time : 2023.11.30（互動技術概論上課）
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
###### Edit Time : 2023.12.1
- 修改程式碼讓蛇順暢移動、增長蛇身
- PROBLEM:當蛇重疊身體時，新長出的身體會覆蓋在前面的身體上面，只有蛇頭在上面通過
    - drawbody:for迴圈i=0開始順向=>從頭到尾畫，重疊會蓋上去；從i=body.size()-1開始畫=>從尾到頭畫，重疊會在下層
![截圖 2023-12-01 下午1.03.24](https://hackmd.io/_uploads/rJ5iFkPB6.png)

### snake_8
###### Edit Time : 2023.12.7、8
- 未處理：snake_7問題、地圖移動問題、加入障礙物＆其他蛇
- 下週展示期中作品：snake_6 修好蛇移動、吃食物，加主畫面切換

### snake_9
###### Edit Time : 2023.12.14、15
- 嘗試讓蛇座標＝滑鼠游標時，原地轉圈圈
- 新增當蛇吃到食物，食物大小、蛇大小改變
- 改變蛇每一節顏色
- 加入障礙物（自由遊走的第二隻蛇）
- 設定畫布範圍劃設界線
- 未處理：地圖移動座標、介面、碰撞蛇偵測、加上蛇的眼睛

### snake_10
###### Edit Time : 2023.12.21
- 新增兩隻蛇碰撞偵測，觸發的GameOver畫面尚未設置
- 解決地圖移動，蛇座標跑走的問題=>小葉幫忙：移動點座標（地圖移動）時，蛇的座標也要一起做移動（加for迴圈）
- 新增變數mapSpeed
- 未處理：介面、蛇畫的方向和長新身體的方向、蛇眼睛、畫布界線（使用變數讓蛇靠近界線時，界線也往蛇靠近）
###### Edit Time : 2023.12.22
- 新增起始畫面、遊戲畫面、暫停、遊戲結束畫面切換功能
- 新增reset函式重啟遊戲

### snake_11
###### Edit Time : 2023.12.28
- 未處理:畫布限制範圍越來越大、加入更多敵人、蛇畫的方向和長新身體的方向

### snake_12
###### Edit Time : 2024.01.04
- 加入共五個敵人
- 修正背景地圖移動
- 優化遊戲界面
- 未處理:加入音效、蛇變大碰撞敵人的偵測範圍沒變大、邊界移動地圖敵人會跟玩家同方向移動

### Final
###### Edit Time : 2024.01.07~2024.01.10
- 以class方法重構snake2~5成物件
- 新增遊戲內障礙蛇與食物超出限制範圍即消失重置的功能
- 改善介面設計、加入遊戲操作說明
- 加入音樂、音效
- 沒處理：蛇變大碰撞敵人的偵測範圍沒變大、邊界移動地圖敵人會跟玩家同方向移動（想不到解決方法）