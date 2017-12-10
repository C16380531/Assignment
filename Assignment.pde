Accelerator  theAccelerator; 

void setup()
{
  size(700, 400);
  theAccelerator  =  new  Accelerator();
  
}
void draw(){
  background(1);
  drawWindow();
  drawFuel();
  drawMilo();
  drawSpeed();
  
  theAccelerator.draw();
  if(mousePressed)
  {
    float X=mouseX;
    float Y=mouseY;
    if(X>280 && X<320 && Y>200 && Y<300)
    {
      
    }
  }
  
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

void drawSpeed()
{
  stroke(2);
  ellipse(140, 340, 140, 140);
  stroke(1);
  arc(140, 340, 130, 130, HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI );
  float points = 20; //number of points
  float pointAngle = 270/points; //angle between points
  float pointAngle2= radians(pointAngle);
  int radius = 65;
  int counter=0;
  for(float angle = 135; angle <= 405; angle = angle+pointAngle) { 
  float x1 = cos(radians(angle)) * radius; 
  float y1 = sin(radians(angle)) * radius;
  float x2 = cos(radians(angle)) * (radius-10); 
  float y2 = sin(radians(angle)) * (radius-10);
  float x3 = cos(radians(angle)) * (radius-16); 
  float y3 = sin(radians(angle)) * (radius-16);
  line(140+x1,340+ y1, 140+x2,340+ y2);
  fill(0);
  textSize(4);
  text(counter,140+x3,340+ y3);
   counter=counter+10;
}
}