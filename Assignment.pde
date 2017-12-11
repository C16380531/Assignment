import processing.sound.*;


Accelerator  theAccelerator; 
Brake  theBrake; 
Line theLine;

SoundFile Driving;
SoundFile Start;

PImage Gauge;
PImage Background;

void setup()
{
  size(700, 400);
  theAccelerator  =  new  Accelerator();
  theBrake  =  new  Brake();
  theLine= new Line();
  Start = new SoundFile(this, "CarStart.mp3");
  Driving= new SoundFile(this, "CarDriving.wav");
  Start.play();
  Gauge = loadImage("gauge.png");
  Background = loadImage("road2.jpg");
  Driving.loop();
}
float speed=0;
float fuel=100;
float Miles=0;
void draw(){
  background(1);
  drawWindow();
  drawFuel(fuel);
  drawMilo(Miles);
  drawSpeed(speed);
  drawRPM(speed);
  theAccelerator.draw();
  theBrake.draw();
  theLine.draw();
  theLine.move(speed);
  if(mousePressed)
  {
    float X=mouseX;
    float Y=mouseY;
    if(X>600 && X<640 && Y>260 && Y<360 && fuel>0)
    {
        if(speed<=190)
        {
        speed=speed+10;
        }else{
          speed=200;
        }
        
        drawSpeed(speed);
      
    }
    if(X>500 && X<580 && Y>310 && Y<360 )
    {
      
        if(speed>=10)
        {
        speed=speed-10;
        }else{
          speed=0;
        }
        drawSpeed(speed);
      
    }
    
  }
  
  if(speed!=0 && fuel>0)
  {
    
    Miles=Miles+speed/21600;//for purpose of demonstration 216,000 has been shortened to 21,600
    fuel=fuel-((speed/21600)*30);//33 miles to the  
  }
  
  if(Miles==100000)
  {
    Miles=0; //ensure number doesn't leave milometer
  }
  
  if(fuel<0 && speed>0)
  {
    speed=speed-1;
    drawSpeed(speed);
  }
  
  if(fuel<0)
  {
    fill(192,192,192);
    stroke(1);
    rect(250,200,200,100);
    fill(255,0,0);
    textSize(20);
    textAlign(CENTER);
    text("Refuel Car",350,250);
    
    if(mousePressed)
    {
      float X=mouseX;
      float Y=mouseY;
      if(X>250 && X<450 && Y>200 && Y<300)
      {
          fuel=100;
      }
    }
  }
}
void drawWindow()
{
  strokeWeight(1);
  stroke(1);
  fill(255);
  quad(50, 50, 650, 50, 600, 380,100, 380);
  image(Background,50,50,600,330);

  
}
void drawFuel(float fuel)
{
  strokeWeight(1);
  stroke(1);
  rect(70,60,80,30,10);
  fill(0);
  textSize(10);
  text("E", 80, 102);
  text("F", 135, 102);
  line(80,60,80,90);
  line(135,60,135,90);
  
  image(Gauge,97,95,20,20);

    
  float Fuel= map(fuel,0,100,0,80);
  if(Fuel>30)
  {
    fill(0,255,0);
    rect(70,60,Fuel,30,10);
  }
  else if(Fuel>2)
  {
    fill(255,0,0);
    rect(70,60,Fuel,30,10);
  }
  
}
void drawMilo(float Miles)
{
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(170,60,80,30,10);
  fill(0);
  text("Miles",210,102);
  textSize(15);
  textAlign(CENTER);
  int miles=int(Miles);
  text(miles,210,82.5);
}

void drawSpeed(float Speed)
{
  fill(1);
  strokeWeight(1);
  stroke(255);
  ellipse(140, 340, 140, 140);
  stroke(255);
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
  fill(255);
  textSize(5);
  text(counter,140+x3,340+ y3);
   counter=counter+10;
}
  
  float pos=map(Speed,0,200,HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI );
  noFill();
  stroke(255,0,0);
  strokeWeight(5);
   arc(140, 340, 135, 135, HALF_PI+QUARTER_PI, pos );
}

void drawRPM(float Speed)
{
  fill(1);
  strokeWeight(1);
  stroke(255);
  ellipse(80, 340, 140, 140);
  stroke(255);
  arc(80, 340, 130, 130, HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI );
  float points = 24; //number of points
  float pointAngle = 270/points; //angle between points
  float pointAngle2= radians(pointAngle);
  int radius = 65;
  
  int counter2=0;
  int counter=0;
  for(float angle = 135; angle <= 405; angle = angle+pointAngle) { 
  float x1 = cos(radians(angle)) * radius; 
  float y1 = sin(radians(angle)) * radius;
  float x2 = cos(radians(angle)) * (radius-2); 
  float y2 = sin(radians(angle)) * (radius-2);
  float x4 = cos(radians(angle)) * (radius-12); 
  float y4 = sin(radians(angle)) * (radius-12);
  float x3 = cos(radians(angle)) * (radius-16); 
  float y3 = sin(radians(angle)) * (radius-16);
  
  if(counter%3==0)
  {
    line(80+x1,340+ y1, 80+x4,340+ y4);
    text(counter2,80+x3,340+ y3);
    println(counter2);
    counter2=counter2+1;
  }else
  {
    line(80+x1,340+ y1, 80+x2,340+ y2);
  }
  fill(255);
  textSize(5);
  counter=counter+1;
}
  
  float pos=map(Speed,0,200,HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI );
  noFill();
  stroke(255,0,0);
  strokeWeight(5);
   arc(80, 340, 135, 135, HALF_PI+QUARTER_PI, pos );
}