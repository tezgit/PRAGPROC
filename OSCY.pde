import oscP5.*;
import netP5.*;
import java.util.*;  // needed for List
OscP5 oscP5;
NetAddress myRemoteLocation;
String OSCmsg;

float FADER1, FADER2, FADER3, FADER4;
boolean TOG1, TOG2, TOG3, TOG4;

// for INIT see SETUP in main sketch

//////////////////////////////////////////////////
void OSCout(String ss, float num) {
  myRemoteLocation = new NetAddress(OSCHOST,9999);
  OscMessage myMessage = new OscMessage(ss);  
  myMessage.add(num); /* add an int to the osc message */
  oscP5.send(myMessage, myRemoteLocation);
}
  
  
//////////////////////////////////////////////////
void OSCtrig(float num) {
  OscMessage myMessage = new OscMessage("/trig");  
  myMessage.add(num); /* add an int to the osc message */
  oscP5.send(myMessage, myRemoteLocation);
}
  
///////////////////////////////////////////////////
void oscEvent(OscMessage theOscMessage) {
  
    if(theOscMessage.checkAddrPattern("/sk0")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        StopTimers();
        SKETCHNUM = 0;
        background(0);
        return;
      }  
      
    }else if(theOscMessage.checkAddrPattern("/sk1")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        
        println("GoTo 1");
        
        GoTo(1);
        
        //SKETCHNUM = 1;
        //StopTimers();
        //setup_ASLEEP();
        //delay(gaptime)        
        return;
      }  
      
    }else if(theOscMessage.checkAddrPattern("/sk2")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        StopTimers();
        setup_SELK();
        delay(gaptime);
        SKETCHNUM = 2;
        return;
      }  
      
    }else if(theOscMessage.checkAddrPattern("/sk3")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        StopTimers();
        setup_DUST();
        delay(gaptime);
        SKETCHNUM = 3;
        return;
      }  
      
    }else if(theOscMessage.checkAddrPattern("/sk4")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        StopTimers();
        setup_META();
        delay(gaptime);
        SKETCHNUM = 4;
        return;
      }  

 
    }else if(theOscMessage.checkAddrPattern("/f1")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        FADER1 = firstValue;
        cons(1, str(FADER1));
        return;
      }  
 
 
    }else if(theOscMessage.checkAddrPattern("/f2")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        FADER2 = firstValue;
        return;
      }  
 
    }else if(theOscMessage.checkAddrPattern("/f3" )==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        FADER3 = firstValue;
        return;
      }  
 
    }else if(theOscMessage.checkAddrPattern("/f4")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        FADER4 = firstValue;
        return;
      }  
 
   
  }else if(theOscMessage.checkAddrPattern("/t1")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        TOG1 = boolean(int(firstValue));
        return;
      }    
   
  } else if(theOscMessage.checkAddrPattern("/t2")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        TOG2 = boolean(int(firstValue));
        return;
      }   
   
  }else if(theOscMessage.checkAddrPattern("/t3")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        TOG3 = boolean(int(firstValue));
        return;
      }  
   
  }else if(theOscMessage.checkAddrPattern("/t4")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        TOG4 = boolean(int(firstValue));
        return;
      }  
   
  } else if(theOscMessage.checkAddrPattern("/framerate")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue(); 
        if (firstValue != fr){
          fr = int(firstValue);
          cons(4, "framerate: " + fr);
          //frameRate(fr);
          redraw();
        }
        return;
      }  
   
  } else if(theOscMessage.checkAddrPattern("/ray")==true) {
      /* check if the typetag is the right one. */
      if(theOscMessage.checkTypetag("f")) {
        /* parse theOscMessage and extract the values from the osc message arguments. */
        float firstValue = theOscMessage.get(0).floatValue();  
        trigRay();
      }
      
        return;
      }  

    
   else{
     // NADA 
     }
  
  //println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
}
