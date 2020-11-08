import com.dhchoi.CountdownTimer;
import com.dhchoi.CountdownTimerService;

//CountdownTimer timer1; // for DUST
String timerCallbackInfo = "";

CountdownTimer timer0 = CountdownTimerService.getNewCountdownTimer(this).configure(100, 5000); // for DUST
CountdownTimer timer1 = CountdownTimerService.getNewCountdownTimer(this).configure(100, 7000); // for META



void onTickEvent(CountdownTimer XXtimer, long timeLeftUntilFinish) {
    //println("ticking timer 0: " + timeLeftUntilFinish);
      // float ac=CountdownTimerService.getCountdownTimerForId(0).getTimerDuration() / 250.;
      //fadin = int(((CountdownTimerService.getCountdownTimerForId(0).getTimerDuration()-timeLeftUntilFinish) / ac ) );
      float ac=XXtimer.getTimerDuration() / 250.;
      fadin = int(((XXtimer.getTimerDuration()-timeLeftUntilFinish) / ac ) );
 
      print("XXtimer ticking --- ");
}

void onFinishEvent(CountdownTimer XXtimer){
        println("***********************");
        println("TIMER ID = " + XXtimer);
        println("getTimerIds: " + ""); 
        println("***********************");
        
        DustChangePix();
        int neotime=int(random(15)+5) * 2000;
        //CountdownTimerService.getCountdownTimerForId(0).stop(CountdownTimer.StopBehavior.STOP_IMMEDIATELY);      
        XXtimer.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);      
        trigDustOrbit();
        //CountdownTimerService.getCountdownTimerForId(0).configure(100, neotime);
        XXtimer.configure(100, neotime);
        //CountdownTimerService.getCountdownTimerForId(0).start();
        //timer1.start();
        println("timer0 stopr and restared, neotime = " + neotime);

}

//void xonTickEvent(CountdownTimer timer1, long timeLeftUntilFinish) {
//    //println("ticking timer 1: " + timeLeftUntilFinish);
//      float ac=CountdownTimerService.getCountdownTimerForId(0).getTimerDuration() / 250.;
//      fadin_meta = int(((CountdownTimerService.getCountdownTimerForId(0).getTimerDuration()-timeLeftUntilFinish) / ac ) );
//      pixbuff(fadin); // update pixel buffer  
//}

//void xonFinishEvent(CountdownTimer timer1) {
//  println("Finished timer 1: ");
//     int neotime=int(random(15)+10) * 2000;
//     ChangeMetaPix();
//     timer1.configure(100, neotime).start();
//     randrot();
  
//}



/*

///////////////
void onTickEvent(CountdownTimer xtimer, long timeLeftUntilFinish) {
  //timerCallbackInfo = "[tick] - timeLeft: " + timeLeftUntilFinish + "ms";
  if(SKETCHNUM == 3){
      float ac=xtimer.getTimerDuration() / 250.;
      fadin = int(((xtimer.getTimerDuration()-timeLeftUntilFinish) / ac ) );
  }else if(SKETCHNUM == 4){
    float ac=timer1.getTimerDuration() / 250.;
      fadin = int(((xtimer.getTimerDuration()-timeLeftUntilFinish) / ac ) );
      pixbuff(fadin); // update pixel buffer  
  }
  
}



////////////////////
void onFinishEvent(CountdownTimer xtimer) {
  //timerCallbackInfo = "[finished]";
  println("timer1 finished");
  if(SKETCHNUM == 3){
      DustChangePix();
       int neotime=int(random(15)+5) * 2000;
       xtimer = CountdownTimerService.getNewCountdownTimer(this).configure(100, neotime).start(); 
       trigDustOrbit();
    }else if(SKETCHNUM == 4){
        int neotime=int(random(15)+10) * 2000;
        ChangeMetaPix();
        xtimer = CountdownTimerService.getNewCountdownTimer(this).configure(100, neotime).start();
        randrot();
    } 
}

*/
