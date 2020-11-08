// META MODULE 
PGraphics pixbuffer, fadebuffer;
IntList metapix;
float rot1, rot2, rot3;

PImage pragmalogo;


//////////////////////////////////
void setup_META() {
  
  
  FADER1 = 0;
  FADER2 = 0;
  FADER3 = 0;
  FADER4 = 0;
  TOG1 = false;
  TOG2 = false;
  TOG3 = false;
  TOG4 = false;
  
  
  maxpix = 16;
  nextpic = 0;
  
  metapix = new IntList(); 
  for(int i=0; i<maxpix;i++){
    metapix.append(i);
  }
  metapix.shuffle();


  int rr=int(random(20)+1);
  photo = loadImage(sketchPath + "/metapix/meta-" + int(metapix.get(0)) + ".jpg");
  //fadepic = loadImage(sketchPath + "/metapix/meta-" + int(metapix.get(1)) + ".jpg");
  fadepic = loadImage(sketchPath + "pix/black720.jpg");
  maskImage = loadImage(sketchPath + "/metapix/maskaW720.jpg");
  photo.mask(maskImage);
  fadepic.mask(maskImage);
 
  pixbuffer = createGraphics(photo.width, photo.height);
  fadebuffer = createGraphics(photo.width, photo.height);
  
  
  overpix = loadImage(sketchPath + "/metapix/meta-" + int(metapix.get(0)) + ".jpg");
  overpix.mask(maskImage);
  
  pragmalogo = loadImage(sketchPath + "pix/PRAGMA720.jpg");
  pragmalogo.mask(pragmalogo);
 
  
  randrot();
   
  // create and start a timer that has been configured to trigger onTickEvents every 100 ms and run for 5000 ms
  //timer1 = CountdownTimerService.getNewCountdownTimer(this).configure(100, 5000).start();
      //CountdownTimerService.getCountdownTimerForId(1).start();
       timer1.start();
     println("timer 1 / META started");

}

////////////////////
void draw_META() {

  angle += 0.003;
  angle2 -= 0.00457;
 
 
  pushMatrix();  

    tint(255,90); 
       
    // PHOTO1    
    rotate(angle * 2.7); // 2
    image(pixbuffer, 0,0);
      
    // PHOTO2 
    rotate(angle2 * 3.1); // 3
    //tint(255,90); 
    image(pixbuffer,0,0);
     
    // PHOTO3
    rotate(angle * 1.45); // 1.5
    //tint(255,90); 
    image(pixbuffer,0,0);
    
  
  popMatrix();
  

}


////////////////////
void ChangeMetaPix(){ 
  
  CHANGESWITCH=true;

  newpix = "/metapix/meta-" + (metapix.get(nextpic) +1) +".jpg";
  //println("newpix: " + newpix);
  photo = loadImage(sketchPath + newpix);
  photo.mask(maskImage);
  RVIB = int(random(2)+2);
  
   if(nextpic<(maxpix-1)){
      nextpic +=1;
  }else{
    nextpic = 1;
    metapix.shuffle();
    ITER+=1;
    println("ITER: " + ITER);
  }
  
  tint(255,0);
  //image(fadepic,-2000, -2000);
  fadin_meta = 0;
  fadepic = loadImage(sketchPath + "/metapix/meta-" + (metapix.get(nextpic) +1)+".jpg");
  fadepic.mask(maskImage);
  //fadepic.mask(pragmalogo);


  CHANGESWITCH=false;
}



/////////////////////////////
void pixbuff(int fadelevel){
  
  pixbuffer.beginDraw(); 
    pixbuffer.tint(255,fadelevel); 
    pixbuffer.image(fadepic, 0,0);  
   
    if(TOG1){
      pixbuffer.tint(255,90); 
      pixbuffer.image(pragmalogo, 0,0);
    }
    
    pixbuffer.mask(maskImage);
  pixbuffer.endDraw();  
  
}


////////////////////////////
void randrot(){ 
  int r = int(random(1,3));
  switch(r) {
    case 1: 
    rot1 = 1.2 + random(1.,3.);
    case 2:
    rot2 = 1.5 + random(1.,3.);
    case 3:
    rot3 = 1.5 + random(1.,3.);  
  }
}
