void setup()
{
  size(700, 400);
}
void draw(){
  background(1);
  drawWindow();
  drawFuel();
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
}