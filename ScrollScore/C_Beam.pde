// DECLARE/INITIALIZE CLASS SET
BeamSet beamz = new BeamSet();

/**
 /// PUT IN SETUP ///
 meosc.plug(beamz, "mk", "/mkbeam");
 meosc.plug(beamz, "rmv", "/rmvbeam");
 meosc.plug(beamz, "rmvall", "/rmvallbeam");
 
 /// PUT IN DRAW ///
 beamz.drw();
 **/

class Beam {
  // CONSTRUCTOR VARIALBES //
  int ix;
  // CLASS VARIABLES //
  float x1, y1, x2, y2;
  // CONSTRUCTORS //

  /// Constructor 1 ///
  Beam(int aix, int n1, int n2) {
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
    }
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
    strokeWeight(1);
    stroke(0);
    strokeCap(SQUARE);
    line(x1, y1, x2, y2);
  } //End drw
  //
  //
}  //End class

////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class BeamSet {
  ArrayList<Beam> cset = new ArrayList<Beam>();

  // Make Instance Method //
  void mk(int ix, int n1, int n2) {
    cset.add( new Beam(ix, n1, n2) );
  } //end mk method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Beam inst = cset.get(i);
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
      Beam inst = cset.get(i);
      inst.drw();
    }
  }//end drw method
  //
  //
} // END CLASS SET CLASS






