//
// This program gathers input from a sensor through
// analog pin 0 and passes the output to the serial connection.
//
// It also outputs to two LEDs that will give metronome time
//


int analogPin = 5;          // identify analog pin to be used
int val = 0;                // variable to store the value read
long takeaway;              // time at end of setup
int LED1 = 11;              // quarters pin
int LED2 = 12;              // whole pin
long check = 0;             // helps for bpm
int ct = 3;                 // counting for 4 count
long holdtime;              // time since loop started
int upDown = 0;             // on-off value for LEDs

void setup() {
  Serial.begin(57600);      //  setup serial baud rate
  //  you may choose to use 115200 if you have trouble
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  delay(1000);
  takeaway = millis();
}

void loop() {
  // Get time since startup ended
  holdtime = millis() - takeaway;
  // On state, what beat
  if (holdtime > check and upDown == 0) {
    digitalWrite(LED1, 1);
    ct += 1;
    if (ct == 4) {
      digitalWrite(LED2, 1);
      ct = 0;
    }
    check += 200;
    upDown = 1;
  }
  // Off state, global
  if (holdtime > check and upDown == 1) {
    digitalWrite(LED1, 0);
    if (ct == 0) {
      digitalWrite(LED2, 0);
    }
    check += 600;
    upDown = 0;
  }
  // Print time
  Serial.print(holdtime);
  Serial.print(' ');
  // Print aRval
  val = analogRead(analogPin);    // read the input pin
  Serial.println(val);            // print value to serial monitor
}
