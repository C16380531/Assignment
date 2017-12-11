class Line
{
  float X=350;
  float Y=180;
  float lineLength=0;
  void draw()
  {  
    strokeWeight(3);
    stroke(255);
    line(X,Y,X,Y+lineLength);
  }
  void move(float speed)
  {
    Y=Y+(speed/5);
    lineLength=lineLength+(speed/10);
    if(Y>315)
    {
      X=350;
      Y=180;
      lineLength=0;
    }
  }
}