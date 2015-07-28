import oscP5.*;
import netP5.*;


//TURN THIS INTERFACE INTO THE CONTROLER
//// Fixed 8thnote pulse at unison
////// Middle line and a certian color notehead with instructions
////// given to performers to play a designated pitch

//// TUPLET INTERJECTIONS
//////  Way to save and recall cycles

//// IMPROV INTERJECTIONS

//// CHANGE PITCH

//// CURSOR ACCEL DECEL
///// ACCELERATE GRADUALLY (MANUALLY) UNTIL CATCHES UP AND THEN LOCKS NEW TEMPO

//// ACCENTS/DYNAMICS/EXTENDED TECHNIQUES

//// LIVE-ELECTRONICS


//Fix Tups
////option for no label
////option for single number

//note head colors
//make tactile controler with switch and velostat/pipe 'abacus' for max and mins
////for push add random tuplet
////button to change the tessatura of noteheads
////button to change color of noteheads


//3 different color notheads
//initial tempo
//improve tuplets
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
String svgspath;
File svgfolder;
PShape[] svgset;
IntDict svgnames;
float[][] svgwh;
PFont monaco12;

void setup() {
  frameRate(frmrt);
  size(1000+(margin*2), 1000);
  spf = 1.0/frmrt;
  monaco12 = loadFont("Monaco-12.vlw");
  textFont(monaco12);

  svgnames = new IntDict();
  svgspath = sketchPath("svgs/");
  svgfolder = new File(svgspath);

  if (svgfolder.exists() && svgfolder.isDirectory()) {
    svgset = new PShape[svgfolder.listFiles().length];
    svgwh = new float[svgfolder.listFiles().length][2];
    for (int i=0; i<svgfolder.listFiles ().length; i++) {
      if (!svgfolder.listFiles()[i].getName().equals(".DS_Store")) {
        svgset[i] = loadShape(svgfolder.listFiles()[i].getPath());
        svgnames.set(svgfolder.listFiles()[i].getName(), i);
        svgwh[i][0] = svgset[i].getWidth();
        svgwh[i][1] = svgset[i].getHeight();
      }
    }
  }

  osc = new OscP5(this, 12321);
  osc.plug(scrollz, "mk", "/mkscroll");
  osc.plug(scrollz, "rmv", "/rmvscroll");
  osc.plug(scrollz, "rmvall", "/rmvallscroll");
  osc.plug(scrollz, "chgtmp", "/chgtmp");
  osc.plug(scrollz, "chgpos", "/chgpos");
  osc.plug(scrollz, "chgdir", "/chgdir");
  scrollz.mk(0, 100, 20, 1000, 170, 2, 1, 1, 220, "white", "limegreen");
  scrollz.mk(1, 100, 200, 1000, 170, 2, 1, 1, 220, "white", "sunshine");
  notesz.mk(0, 0, 0, 3, 0, "White_mensural_minim.svg");
  notesz.mk(1, 0, 0, 3.5, 10, "Black_mensural_minim.svg");
  notesz.mk(2, 0, 0, 4, 2, "Black_mensural_minim.svg");
  notesz.mk(3, 0, 0, 4.5, 3, "Black_mensural_minim.svg");
  // notesz.mk(4, 0, 0, 5, 4, "Black_mensural_minim.svg");
  // notesz.mk(5, 0, 0, 5.5, 5, "Black_mensural_minim.svg");
  notesz.mk(6, 0, 0, 6, 6, "Black_mensural_minim.svg");
  notesz.mk(7, 0, 0, 6.5, 7, "Black_mensural_minim.svg");
  notesz.mk(8, 0, 0, 7, 8, "Black_mensural_minim.svg");
  notesz.mk(9, 0, 0, 7.1666, 8, "Black_mensural_minim.svg");
  notesz.mk(10, 0, 0, 7.333, 8, "Black_mensural_minim.svg");
  notesz.mk(11, 0, 0, 7.5, 8, "Black_mensural_minim.svg");
  notesz.mk(12, 0, 0, 7.6666, 8, "Black_mensural_minim.svg");
  notesz.mk(13, 0, 0, 7.8333, 8, "Black_mensural_minim.svg");


  notesz.mk(14, 0, 1, 2, 2, "Black_mensural_minim.svg");
  notesz.mk(15, 0, 1, 2.33333, 5, "Black_mensural_minim.svg");
  notesz.mk(16, 0, 1, 2.66666, 11, "Black_mensural_minim.svg");
 // beamz.mk(14, 14, 15);
 // beamz.mk(15, 15, 16);
  tupsz.mk(1, 14, 16, 3, 1);
  

  notesz.mk(17, 0, 1, 13, 5, "Black_mensural_minim.svg");
  notesz.mk(18, 0, 1, 13.2, 1, "Black_mensural_minim.svg");
  notesz.mk(19, 0, 1, 13.4, 13, "Black_mensural_minim.svg");
  notesz.mk(20, 0, 1, 13.6, 3, "Black_mensural_minim.svg");
  notesz.mk(21, 0, 1, 13.8, 9, "Black_mensural_minim.svg");
  //beamz.mk(17, 17, 18);
  //beamz.mk(18, 18, 19);
  //beamz.mk(19, 19, 20);
  //beamz.mk(20, 20, 21);
  tupsz.mk(8, 17, 21, 5, 1);

  //beamz.mk(0, 0, 1);
  //beamz.mk(1, 2, 3);
  
  tupsz.mk(11, 2, 3, 2, 1);
  tupsz.mk(12, 0, 1, 2, 1);
  //beamz.mk(3, 6, 7);
 // beamz.mk(2, 8, 13);
  tupsz.mk(0, 8, 13, 6, 1);
}
void draw() {
  background(25, 33, 47);
  scrollz.drw();
  beamz.drw();
  notesz.drw();
  tupsz.drw();
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

