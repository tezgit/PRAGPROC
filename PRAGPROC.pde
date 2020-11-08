// PRAGMA PROC 2020
// SHARED IMPORTS
import java.util.Map;
import java.util.Locale;
import javax.swing.JColorChooser;
import java.awt.Color;
import processing.core.*;
import processing.opengl.PGraphics2D;
import processing.video.Capture;
import processing.video.*;

// PIMAGES
PImage gate, maska, aura, pragma; // MAIN
PImage geometrik, geos, star, smoke, frigio; // ASLEEP
PImage photo, maskImage, gateframe; // SELK
PImage[] afropix = new PImage[4]; // SELK
PImage dustphoto, fadepic; // DUST
PImage overpix; // META
PImage fp0,fp1, fp2, fp3; // DOWSE

// NET
//String OSCHOST = "stealth.local";
String OSCHOST = "T13.local";


// SHARED VARS
int SKETCHNUM = 0;
String sketchPath = "";
Movie myMovie;
int fr = 5; // frame delay
int centerX, centerY;
String newpix = "";
int maxpix = 1;
int nextpic = 0;
float angle=0;
float angle2=0;
int RVIB = 5;
int fadin = 0;
int fadin_meta=0;
int rr = 1;
int ITER = 0;
boolean CHANGESWITCH = false;
int gaptime = 500;

///////////////////////////////////////  
void setup(){
    
  fullScreen(P2D);
  background(0);
  noCursor();
  frameRate(50);
  
  /* start oscP5, listening for incoming messages at port 7777 and sending to OSCHOST at port 9999 */
  oscP5 = new OscP5(this,7777);
  myRemoteLocation = new NetAddress(OSCHOST,9999);
           
  // PATH INIT 
  sketchPath = sketchPath("");
  println("sketchPath: " + sketchPath);
  
  loadPragmages(); // load shared images for interface
  
  FADER1 = 0;
  FADER2 = 0;
  FADER3 = 0;
  FADER4 = 255; // logo Pragma
  TOG1 = true;
  TOG2 = false;
  TOG3 = false;
  TOG4 = false;


}


/////////////////////////////////
public void draw(){
  
  translate(width/2, height/2);
  imageMode(CENTER);
  


  /// SKETCH 0 : INTRO 
   if(SKETCHNUM == 0){    
     background(0);
     GATELOGO(); 
   }
  /// SKETCH 1 : ASLEEP 
   else if(SKETCHNUM == 1){     
     background(0);
     draw_ASLEEP(); // DRAWING SKETCH ASLEEP  
   }
  /// SKETCH 2 : SELK 
   else if(SKETCHNUM == 2){    
     background(0);
     draw_SELK(); // DRAWING SKETCH SELK  
   }
  /// SKETCH 3 : DUST 
   else if(SKETCHNUM == 3){     
     draw_DUST(); // DRAWING SKETCH DUST  
   }
  /// SKETCH 4 : META 
   else if(SKETCHNUM == 4){     
     draw_META(); // DRAWING SKETCH META  
   }
   /// SKETCH 4 : META 
   else if(SKETCHNUM == 5){     
     draw_DOWSE(); // DRAWING SKETCH META  
   }
                
  // GREY CIRCLE    
  greyCirck();
    
 // DEBUG >> CONSOLE DISPLAY
  if(DEBUG){
    cons(1, sketchPath);   
    showConsole();
  }
  
  // FRAME CONTROL
  //if(fr>0){delay(fr);} // control frame delay 

}
  
 
//////////////////////////
void movieEvent(Movie m) {
  m.read();
}

//////////////////////////
void   greyCirck(){
       // GREY CIRCLE
      smooth();
      noFill();
      if(SKETCHNUM == 4){
        stroke(0,0,0); 
      }else{
        stroke(70,70,70);
      }
      
      strokeWeight(20); 
      circle(0, 0, 690);   
}

//////////////////////////
void loadPragmages(){
  maska = loadImage(sketchPath + "pix/maskaW720.jpg");
  pragma = loadImage(sketchPath + "pix/pragma.png");
  pragma.resize(80,80);

  gate = loadImage(sketchPath + "pix/PRAGMAGATE.jpg");
  gate.mask(maska);
}

//////////////////////////
void GATELOGO(){
    // LOGO PRAGMA GATE 
    tint(255,FADER4 * 255);// fader4 is set via OSC
    image(gate,0,0);    
}

//////////////////////////
void GoTo(int sketchnum){
  
        //StopTimers();
        
  switch(sketchnum){
    case 1:   
      setup_ASLEEP();
      delay(gaptime);
      SKETCHNUM = 1;
      break;
      
      
  }

}

/////////////////////////
void StopTimers(){
   
   //TOG1 = false;
   //TOG2 = false;
   //TOG3 = false;
   //TOG4 = false;
   //background(0);

  //CountdownTimerService.getCountdownTimerForId(0).stop(CountdownTimer.StopBehavior.STOP_IMMEDIATELY);
  //CountdownTimerService.getCountdownTimerForId(1).stop(CountdownTimer.StopBehavior.STOP_IMMEDIATELY);
  
}
