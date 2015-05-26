//make into class
//add position changes
//add gradually changing tempi(accel)
// double cursor and unison sync

float bpm = 120.0;
int numbeats = 20;
float pxperbeat = 50.0;
int margin = 100;
float csrx = 0;
int stfht = 150;
int frmrt = 30;
float bps, ppf, pps;
int dir = 1;

void setup() {
  frameRate(frmrt);
  size(1000+(margin*2), 300);
  bps = bpm/60.0;
  pps = bps*pxperbeat;
  ppf = pps/frmrt;
  println(ppf);
}

void draw() {
  background(25, 33, 47);
  noStroke();
  fill(0);
  rect(margin, 20, 1000, stfht);
  stroke(255, 128, 0, 80);
  strokeWeight(1);
  for (int i=0; i<numbeats; i++) {
    float bmx = margin+(pxperbeat*i);
    line(bmx, 0, bmx, height);
  }
  //Animate Cursor
  csrx = floor(csrx + ppf)%1000;
  //Cursor
  stroke(153, 255, 0, 120);
  strokeWeight(3);
  line(csrx+margin, 20, csrx+margin, stfht);
}

void changetempo(float a_bpm) {
  bps = a_bpm/60.0;
  pps = bps*pxperbeat;
  ppf = pps/frmrt;
}

void keyPressed() {
  if (key=='1') changetempo(60);
  if (key=='2') changetempo(85);
  if (key=='3') changetempo(120);
  if (key=='4') changetempo(230);
  if (key=='a') changetempo(36.0);
}

