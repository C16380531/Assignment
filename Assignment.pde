void setup()
{
  size(700, 400);
}
void draw(){
  background(1);
  drawWindow();
}
void drawWindow()
{
  fill(255);
  quad(50, 50, 650, 50, 600, 380,100, 380);
}