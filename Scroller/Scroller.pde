import oscP5.*;
import netP5.*;

// double cursor and unison sync
////color of cursor
//sync server sends periodic position changes based on server cursor positions
//loop cursors over fixed area

int frmrt = 30;
int margin = 100;
float spf;
OscP5 osc;

void setup() {
  frameRate(frmrt);
  size(1000+(margin*2), 1000);
  spf = 1.0/frmrt;
  osc = new OscP5(this, 12321);
  osc.plug(scrollz, "mk", "/mkscroll");
  osc.plug(scrollz, "rmv", "/rmvscroll");
  osc.plug(scrollz, "rmvall", "/rmvallscroll");
  osc.plug(scrollz, "chgtmp", "/chgtmp");
  osc.plug(scrollz, "chgpos", "/chgpos");
  osc.plug(scrollz, "chgdir", "/chgdir");
  scrollz.mk(0, 100, 20, 1000, 230, 2, 1, 1, 265, "black", "limegreen");
  scrollz.mk(1, 100, 265, 1000, 230, 2, 1, 1, 265, "black", "sunshine");
}

void draw() {
  background(25, 33, 47);
  scrollz.drw();
}

//Get current millis
int mark() {
  int nowl;
  nowl = millis();
  return nowl;
}

void keyPressed() {
  if (key=='a')scrollz.chgtmp(1, 15.1, 55);
  if (key=='1')scrollz.chgpos(1, 1);
  if (key=='2')scrollz.chgpos(1, 5);
  if (key=='q')scrollz.chgdir(1, -1);
  if (key=='w')scrollz.chgdir(1, 1);
}

