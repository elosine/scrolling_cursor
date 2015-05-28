import oscP5.*;
import netP5.*;


//y location for beats
//load folder of svgs
//3 different colors
// algorithm for calculating yinc, max y pos, based on svg bounding box
// bounding box info for svg - getWidth(), getHeight();
// beams
// tuplets
//colors
// double cursor and unison sync
////color of cursor
//sync server sends periodic position changes based on server cursor positions
//loop cursors over fixed area

int frmrt = 30;
int margin = 100;
float spf;
OscP5 osc;
PShape minim;


void setup() {
  frameRate(frmrt);
  size(1000+(margin*2), 1000);
  minim = loadShape("Black_mensural_minim_11x40.svg");
  spf = 1.0/frmrt;
  osc = new OscP5(this, 12321);
  osc.plug(scrollz, "mk", "/mkscroll");
  osc.plug(scrollz, "rmv", "/rmvscroll");
  osc.plug(scrollz, "rmvall", "/rmvallscroll");
  osc.plug(scrollz, "chgtmp", "/chgtmp");
  osc.plug(scrollz, "chgpos", "/chgpos");
  osc.plug(scrollz, "chgdir", "/chgdir");
  scrollz.mk(0, 100, 20, 1000, 230, 2, 1, 1, 265, "white", "limegreen");
  scrollz.mk(1, 100, 265, 1000, 230, 2, 1, 1, 265, "white", "sunshine");
  notesz.mk(0, 0, 0, 3, 0);
  notesz.mk(1, 0, 0, 3.5, 1);
  notesz.mk(2, 0, 0, 4, 2);
  notesz.mk(3, 0, 0, 4.5, 3);
  notesz.mk(4, 0, 0, 5, 4);
  notesz.mk(5, 0, 0, 5.5, 5);
  notesz.mk(6, 0, 0, 6, 6);
  notesz.mk(7, 0, 0, 6.5, 7);
  notesz.mk(8, 0, 0, 7, 8);
  notesz.mk(9, 0, 0, 7.5, 9);
  notesz.mk(10, 0, 0, 8, 10);
  notesz.mk(3, 0, 0, 8.5, 11);
  notesz.mk(4, 0, 0, 9, 12);
  notesz.mk(5, 0, 0, 9.5, 13);
  notesz.mk(6, 0, 0, 10, 14);
  notesz.mk(7, 0, 0, 10.5, 15);
  notesz.mk(8, 0, 0, 11, 16);
  notesz.mk(9, 0, 0, 11.5, 17);
  notesz.mk(10, 0, 0, 12, 18);
}

void draw() {
  background(25, 33, 47);
  scrollz.drw();
  notesz.drw();
}

//Get current millis
int mark() {
  int nowl;
  nowl = millis();
  return nowl;
}

void keyPressed() {
  if (key=='a')scrollz.chgtmp(0, 15.1, 55);
  if (key=='1')scrollz.chgpos(1, 1);
  if (key=='2')scrollz.chgpos(1, 5);
  if (key=='q')scrollz.chgdir(1, -1);
  if (key=='w')scrollz.chgdir(1, 1);
}

