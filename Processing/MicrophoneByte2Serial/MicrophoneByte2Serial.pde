import processing.serial.*;
import processing.sound.*;

AudioIn input;
Amplitude loudness;
Serial myPort;
final int width  = 640;
final int height = 255;
final float VolumeMax = 0.3;

void settings(){
  size(width, height);
}

void setup() 
{
  String portName = Serial.list()[6];
  myPort = new Serial(this, portName, 9600);
  background(255);
  
  input = new AudioIn(this, 0);
  input.start();
  loudness = new Amplitude(this);
  loudness.input(input);
}

void draw(){
  float inputLevel = map(mouseY, 0, height, 1.0, 0.0);
  input.amp(inputLevel);
  
  float volume = loudness.analyze();
  int size = int(map(volume, 0, VolumeMax, 1, 350));
  
  background(125, 255, 125);
  noStroke();
  fill(255, 0, 150);
  // We draw a circle whose size is coupled to the audio analysis
  ellipse(width/2, height/2, size, size);
  
  byte val = byte(constrain(map(volume, 0, VolumeMax, -128, 127), -128, 127));
  myPort.write(val);
  println(val);
}
