void setup()
{
  size(700, 400);
}
void draw(){
  background(1);
  drawWindow();
  drawFuel();
  drawMilo();
}
void drawWindow()
{
  fill(255);
  quad(50, 50, 650, 50, 600, 380,100, 380);
}
void drawFuel()
{
  stroke(1);
  rect(70,60,80,30,10);
  fill(0);  
  text("E", 80, 102);
  text("F", 135, 102);
  line(80,60,80,90);
  line(135,60,135,90);
}
void drawMilo()
{
  
  stroke(1);
  fill(255);
  rect(170,60,80,30,10);
}