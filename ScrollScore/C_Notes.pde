// DECLARE/INITIALIZE CLASS SET
NotesSet notesz = new NotesSet();

/**
 *
 *
 /// PUT IN SETUP ///
 meosc.plug(notesz, "mk", "/mknotes");
 meosc.plug(notesz, "rmv", "/rmvnotes");
 meosc.plug(notesz, "rmvall", "/rmvallnotes");
 
 /// PUT IN DRAW ///
 notesz.drw();
 *
 *
 */


class Notes {

  // CONSTRUCTOR VARIALBES //
  int ix, scrnum, stfnum;
  float beat;
  // CLASS VARIABLES //
  int nstaves;
  int gap;
  int h, l, t, r, b, m, c, y1;
  float x;
  int numbeats;
  float pxperbeat = 50.0;

  // CONSTRUCTORS //

  /// Constructor 1 ///
  Notes(int aix, int ascrnum, int astfnum, float abeat) {
    ix = aix;
    scrnum = ascrnum;
    stfnum = astfnum;
    beat = abeat;
    for (int i=scrollz.cset.size ()-1; i>=0; i--) {
      Scroll inst = scrollz.cset.get(i);
      if (inst.ix == scrnum) {
        numbeats = inst.numbeats;
        nstaves = inst.nstaves;
        gap = inst.gap;
        l = inst.l;
        t = inst.t;
        r = inst.r;
        b = inst.b;
        m = inst.m;
        c = inst.c;
        h = inst.h;
        pxperbeat = inst.pxperbeat;
        break;
      }
    }
    y1 =  t+( (gap+h)*stfnum );
    x = l+(beat*pxperbeat);
  } //end constructor 1


  //  DRAW METHOD //
  void drw() {
    shape(minim, x, y1+100);
  } //End drw


  //// MOUSE METHODS ////

  // Mouse Clicked Method // - When mouse is pressed and then released
  void msclk() {
  }//end msclk method


  // Mouse Pressed Method //
  void msprs() {
  }//end msprs method


  // Mouse Released Method //
  void msrel() {
  }//end msrel method


  // Mouse Moved Method //
  void msmv() {
  }//end msmv method


  // Mouse Dragged Method //
  void msdrg() {
  }//end msdrg method


  // Mouse Wheel Method //
  void mswl() {
  }//end mswl method



  //// KEYBOARD METHODS ////

  // Key Pressed Method //
  void keyprs() {
  }//end keyprs method


  // Key Released Method //
  void keyrel() {
  }//end keyrel method
  //
  //
  //
}  //End class



////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class NotesSet {
  ArrayList<Notes> cset = new ArrayList<Notes>();

  // Make Instance Method //
  void mk(int ix, int scrnum, int stfnum, float beat) {
    cset.add( new Notes(ix, scrnum, stfnum, beat) );
  } //end mk method


  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
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
      Notes inst = cset.get(i);
      inst.drw();
    }
  }//end drw method

/*
  //// CHANGE METHODS ////

  // Change Method //
  void chg(int ix, int var) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      if (inst.ix == ix) {
        inst.var = var;
        //Actions or Calculations Here:

        ///////////////////////////////
        break;
      }
    }
  } //End chg method
*/

  //// MOUSE METHODS ////

  // Mouse Clicked Method // - When mouse is pressed and then released
  void msclk() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      inst.msclk();
    }
  }//end msclk method


  // Mouse Pressed Method //
  void msprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      inst.msprs();
    }
  }//end msprs method


  // Mouse Released Method //
  void msrel() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      inst.msrel();
    }
  }//end msrel method


  // Mouse Moved Method //
  void msmv() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      inst.msmv();
    }
  }//end msmv method


  // Mouse Dragged Method //
  void msdrg() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      inst.msdrg();
    }
  }//end msdrg method


  // Mouse Wheel Method //
  void mswl() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      inst.mswl();
    }
  }//end mswl method



  //// KEYBOARD METHODS ////

  // Key Pressed Method //
  void keyprs() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      inst.keyprs();
    }
  }//end keyprs method


  // Key Released Method //
  void keyrel() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Notes inst = cset.get(i);
      inst.keyrel();
    }
  }//end keyrel method
  //
  //
} // END CLASS SET CLASS



