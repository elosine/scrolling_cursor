// DECLARE/INITIALIZE CLASS SET
TupsSet tupsz = new TupsSet();
/**
 /// PUT IN SETUP ///
 meosc.plug(tupsz, "mk", "/mktups");
 meosc.plug(tupsz, "rmv", "/rmvtups");
 meosc.plug(tupsz, "rmvall", "/rmvalltups");
 /// PUT IN DRAW ///
 tupsz.drw();
 **/
class Tups {
  // CONSTRUCTOR VARIALBES //
  int ix;
  // CLASS VARIABLES //
  float x1, y1, x2, y2, x, w, h;
  String tup;
  float y=9999999;
  // CONSTRUCTORS //

  /// Constructor 1 ///
  Tups(int aix, int n1, int n2, int p1, int p2) {
    ix = aix;
    for (int i=notesz.cset.size ()-1; i>=0; i--) {
      Notes inst = notesz.cset.get(i);
      if (inst.ix == n1) {
        x1 = inst.x;
        y1 = inst.nt;
      }
      if (inst.ix == n2) {
        x2 = inst.x;
        y2 = inst.nt;
      }
      for(int j=n1;j<=n2;j++){
        if(inst.ix==j){
          y = min(y, inst.nt);
        }
      }
    }
    w = x2 - x1;
    x = x1 + (w/2.0);
    tup = p1 + ":" + p2;
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
    fill(clr.get("magenta"));
    textAlign(CENTER, BOTTOM);
    text(tup, x, y);
    stroke(0);
    strokeWeight(1);
    line(x1, y, x1, y1);
    line(x1, y, x-5, y);
    line(x2, y, x2, y2);
    line(x2, y, x-5, y);
  } //End drw
  //
  //
}  //End class

////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class TupsSet {
  ArrayList<Tups> cset = new ArrayList<Tups>();

  // Make Instance Method //
  void mk(int ix, int n1, int n2, int p1, int p2) {
    cset.add( new Tups(ix, n1, n2, p1, p2) );
  } //end mk method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Tups inst = cset.get(i);
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
      Tups inst = cset.get(i);
      inst.drw();
    }
  }//end drw method
  //
  //
} // END CLASS SET CLASS




