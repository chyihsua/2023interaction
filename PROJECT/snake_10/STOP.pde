void stopGame()
{
  background(200, 200, 200);
  //textFont(myfont);
  textSize(80);
  textAlign(CENTER);
  text("STOP", 500, 300);
  textSize(30);
  text("按s鍵繼續遊戲", 500, 450);
  if (key=='s') status=1;
}
