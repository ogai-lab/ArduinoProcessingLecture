int motor0 = 9;
int motor1 = 6;

void setup() {
  Serial.begin(9600);
  pinMode(motor0, OUTPUT);
  pinMode(motor1, OUTPUT);
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

    analogWrite(motor0, int(float(val)/255.0*180.0));
    analogWrite(motor1, 255-int(float(val)/255.0*180.0));
  }
}
