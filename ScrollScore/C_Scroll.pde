// DECLARE/INITIALIZE CLASS SET
ScrollSet scrollz = new ScrollSet();

/**
 *
 *
 /// PUT IN SETUP ///
 meosc.plug(scrollz, "mk", "/mkscroll");
 meosc.plug(scrollz, "rmv", "/rmvscroll");
 meosc.plug(scrollz, "rmvall", "/rmvallscroll");
 
 /// PUT IN DRAW ///
 scrollz.drw();
 *
 *
 */

class Scroll {

  // CONSTRUCTOR VARIALBES //
  int ix, x, y, w, h;
  int nstaves;
  int gap;
  color bgclr, cclr;
  // CLASS VARIABLES //
  int l, t, r, b, m, c;
  boolean bb = true;
  boolean bmk = true;

  float bpm = 120.0;
  int numbeats = 20;
  float pxperbeat = 50.0;
  float csrx = 0;
  int stfht = 150;
  float bps, ppf, pps;
  int dir = 1;
  int stvnum=0;

  //Change Tempo
  int now=0;
  float ctdur = 0;
  float obpm, nbpm;

  // CONSTRUCTORS //

  /// Constructor 1 ///
  Scroll(int aix, int ax, int ay, int aw, int ah, 
  int anstaves, int bbi, int bmki, int agap, String abgclr, String acclr) {
    ix = aix;
    x = ax;
    y = ay;
    w = aw;
    h = ah;
    gap = agap;
    nstaves = anstaves;
    bgclr = clr.get(abgclr);
    cclr = clr.getAlpha(acclr, 150);
    if (bbi==0)bb=false;
    else bb=true;
    if (bmki==0)bmk=false;
    else bmk=true;

    //BOUNDING BOX COORDINATES
    l = x;
    t = y;
    r = l+w;
    b = t+h;
    m = l + round(w/2.0);
    c = t + round(h/2.0);

    bps = bpm/60.0;
    pps = bps*pxperbeat;
    ppf = pps/frmrt;
  } //end constructor 1


  //  DRAW METHOD //
  void drw() {
    //bounding box
    if (bb) {
      for (int i=0; i<nstaves; i++) {
        noStroke();
        fill(bgclr);
        rectMode(CORNER);
        rect(l, t+( (gap+h)*i ), w, h);
      }
    }

    //beat markers
    if (bmk) {
      for (int j=0; j<nstaves; j++) {
        stroke(255, 128, 0, 55);
        strokeWeight(1);
        for (int i=0; i<numbeats; i++) {
          float bmx = l+(pxperbeat*i);
          line(bmx, t+( (gap+h)*j ), bmx, t+( (gap+h)*j )+h );
        }
      }
    }

    //Change Tempo
    if (millis()<=now+ctdur) {
      float cb = map(millis(), now, now+ctdur, obpm, nbpm);
      chgtempo(cb);
    }
    //Animate Cursor
    csrx = csrx + (ppf*dir) ;
    if (csrx>1000) {
      csrx = 0;
      stvnum = (stvnum+1)%nstaves;
    }
    if (csrx<0) {
      csrx = 1000;
      stvnum = (stvnum+1)%nstaves;
    }
    //Cursor
   // stroke(153, 255, 0, 120);
   stroke(cclr);
    strokeWeight(3);
    line(csrx+l, t+( (gap+h)*stvnum ), csrx+l, t+( (gap+h)*stvnum )+h);
  } //End drw
  //
  
  //Change Tempo Method
  void chgtempo(float abpm) {
    ppf = ( (abpm/60.0)*pxperbeat )/frmrt;
    bpm = abpm;
  }

  //
  //
  //
}  //End class

////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class ScrollSet {
  ArrayList<Scroll> cset = new ArrayList<Scroll>();

  // Make Instance Method //
  void mk(int ix, int x, int y, int w, int h, 
  int anstaves, int bbi, int bmki, int gap, String bgclr, String cclr) {
    cset.add( new Scroll(ix, x, y, w, h, anstaves, bbi, bmki, gap,
    bgclr, cclr) );
  } //end mk method


  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Scroll inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method


  // Remove All Method //
  void rmvall() {
    cset.clear();
  } //End rmvall method


  // Draw Set Method //
  void drw() {
    for (int i=0; i<cset.size(); i++) {
      Scroll inst = cset.get(i);
      inst.drw();
    }
  }//end drw method

  //// CHANGE TEMPO ////
  void chgtmp(int ix, float dur, float bpm) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Scroll inst = cset.get(i);
      if (inst.ix == ix) {
        inst.now = millis();
        inst.ctdur = dur*1000;
        inst.obpm = inst.bpm;
        inst.nbpm = bpm;
        ///////////////////////////////
        break;
      }
    }
  } //End  method 

  // Change Position //
  void chgpos(int ix, int bt) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Scroll inst = cset.get(i);
      if (inst.ix == ix) {
        if (bt<inst.numbeats) {
          inst.csrx = (bt-1)*inst.pxperbeat;
        }
        ///////////////////////////////
        break;
      }
    }
  } //End chgpos method

  // Change Direction //
  void chgdir(int ix, int dir) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Scroll inst = cset.get(i);
      if (inst.ix == ix) {
        inst.dir = dir;
        ///////////////////////////////
        break;
      }
    }
  } //End chgpos method
  //// CHANGE METHODS ////


  /*
  // Change Method //
   void chg(int ix, int var) {
   for (int i=cset.size ()-1; i>=0; i--) {
   Scroll inst = cset.get(i);
   if (inst.ix == ix) {
   inst.var = var;
   //Actions or Calculations Here:
   
   ///////////////////////////////
   break;
   }
   }
   } //End chg method */
  //
  //
} // END CLASS SET CLASS

