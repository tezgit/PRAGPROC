

///////////////////////////////////////////////
void keyPressed() {
  // user interface for operating the timer
  switch(key) {
    case '0':
      StopTimers();
      SKETCHNUM = 0;
      background(0);
      break;
    case '1':
      StopTimers();
      setup_ASLEEP();
      delay(gaptime);
      SKETCHNUM = 1;
      break;
    case '2':
      StopTimers();
      setup_SELK();
      delay(gaptime);
      SKETCHNUM = 2;
      break;
    case '3':
      StopTimers();
      setup_DUST();
      delay(gaptime);
      SKETCHNUM = 3;
      break;
    case '4':
      StopTimers();
      setup_META();
      delay(gaptime);
      SKETCHNUM = 4;
      break;     
    case '5':
      StopTimers();
      setup_DOWSE();
      delay(gaptime);
      SKETCHNUM = 5;
      break;
 
    case 'b':
     // TOG1 = !TOG1;
     break;
    case 't':
      TOG1=!TOG1;
     break;
   
    case 'd':
      DEBUG=!DEBUG;
      break;
  }
}


//////////////////////////////////////////////
public void keyReleased(){
    //particles.spawn(width, height, spawn);
    //particles.spawn(cam_w, cam_h, spawn);
}
  
  
