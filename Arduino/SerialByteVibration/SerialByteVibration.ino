int vibration0 = 9;
int vibration1 = 5;
int vibration2 = 6;
int power = 160;

void setup() {
  Serial.begin(9600);
  pinMode(vibration0, OUTPUT);
  pinMode(vibration1, OUTPUT);
  pinMode(vibration2, OUTPUT);
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

    if(val < 85){
      analogWrite(vibration0, power);
      analogWrite(vibration1, 0);
      analogWrite(vibration2, 0);
    }else if(val < 170){
      analogWrite(vibration0, 0);
      analogWrite(vibration1, power);
      analogWrite(vibration2, 0);
    }else{
      analogWrite(vibration0, 0);
      analogWrite(vibration1, 0);
      analogWrite(vibration2, power);
    }
  }
}
