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
- 修改直、橫個字數 25=>50
- 修改畫布 500=>800
- 修改timer 30=>10
- 去除格線 no stroke()
- keyPressed()部分以if判斷替代原先switch()
- 新增上下左右鍵操控 keyCode==up,down,right,left


## snake_2
- 邊界錯誤修正
- 關卡加速 t
- Timer加入影響蛇行走速度
- 顯示Timer(簡單修改版面)
- 新增gameover() gamewin()


## snake_3
- 