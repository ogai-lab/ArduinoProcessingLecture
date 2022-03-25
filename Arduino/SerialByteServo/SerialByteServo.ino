#include <Servo.h>

Servo myservo;

void setup() {
  Serial.begin(9600);
  myservo.attach(6);
}
 
void loop() {
  if(Serial.available() > 0){
    byte val = Serial.read();
    Serial.flush();
    
    if(val < 128){
      val += 128;
    }
    else{
      val -= 128;
    }
    myservo.write(int(float(val)/255.0*180.0));
  }
}
