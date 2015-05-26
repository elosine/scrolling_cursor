

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

  // CLASS VARIABLES //
  float bpm = 120.0;
  int numbeats = 20;
  float pxperbeat = 50.0;
  float csrx = 0;
  int stfht = 150;
  float bps, ppf, pps;
  int dir = 1;


  // CONSTRUCTORS //

  /// Constructor 1 ///
  Scroll() {
    bps = bpm/60.0;
    pps = bps*pxperbeat;
    ppf = pps/frmrt;
  } //end constructor 1


  //  DRAW METHOD //
  void drw() {
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
  } //End drw
  //
  void chgtempo(float a_bpm) {
    bps = a_bpm/60.0;
    pps = bps*pxperbeat;
    ppf = pps/frmrt;
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
  void mk(int ix, int x, int y, int w, int h) {
    cset.add( new Scroll(ix, x, y, w, h) );
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
    for (int i=cset.size ()-1; i>=0; i--) {
      Scroll inst = cset.get(i);
      inst.drw();
    }
  }//end drw method


  //// CHANGE METHODS ////

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
  } //End chg method
  //
  //
} // END CLASS SET CLASS

