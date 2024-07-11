import processing.serial.*;

Serial myPort;
final int width  = 500;
final int height = 200;

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
  byte val = byte(map(mouseX, 0, width, -128, 127));
  myPort.write(val);
  println(val);
  
  delay(100);
}
