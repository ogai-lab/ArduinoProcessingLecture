import processing.serial.*;

Serial myPort;
final int width  = 500;
final int height = 200;
int position = 0;
final int speed = 5;


void settings(){
  size(width, height);
}

void setup() 
{
  println(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  background(255);
}

void draw(){
  byte val = byte(position);
  myPort.write(val);
  println(val);
  
  delay(100);
}

void keyPressed()
{
  if(key == 'l'){
    position = max(-128, position - speed);
  }
  if(key == 'r'){
    position = min(127, position + speed);
  }
}
