void choose()
{
  rect(200,50,70,50);
  rect(200,120,70,50);
  rect(200,190,70,50);
}

boolean press=false;
void mousePressed()
{
  if (mouseX>=200 && mouseX<=270 && mouseY>=50 && mouseY<=100)
  {
    t=30;  s=5;
    press=true;
  }
  else if(mouseX>=200 && mouseX<=270 && mouseY>=120 && mouseY<=170)
  {
    t=20;  s=5;
    press=true;
  }
  else if(mouseX>=200 && mouseX<=270 && mouseY>=190 && mouseY<=240)
  {
    t=15;  s=5;
    press=true;
  }
}
