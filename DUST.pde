// DUST MODULE

ArrayList<Dustorb> dustorbits = new ArrayList<Dustorb>();
// create an object of class Tezorb
Dustorb d;
PVector orbcolor = new PVector(1,255,1);
PVector starcolor = new PVector(1,1,1);
PVector starpos = new PVector(0,0);

IntList dustpix;

/////////////////////////////////////
void setup_DUST() {
  
  TOG1 = true;
  
  newpix = "";
  maxpix = 81;
  nextpic = 0;
   
  dustpix = new IntList(); 
  for(int i=0; i<maxpix;i++){
    dustpix.append(i);
  }
  dustpix.shuffle();
  
 
    translate(width/2, height/2);
    imageMode(CENTER);
    int rr=int(random(20)+1);
    //photo = loadImage(sketchPath + "/dustpix/dust-" + int(dustpix.get(0)) + ".jpg");
    dustphoto = loadImage(sketchPath + "pix/PRAGMAGATE.jpg");
    fadepic = loadImage(sketchPath + "/dustpix/dust-" + int(dustpix.get(0)) + ".jpg");
    maskImage = loadImage(sketchPath + "/dustpix/maskaW720.jpg");
    dustphoto.mask(maskImage);
    fadepic.mask(maskImage); 
 
 
    orbcolor = getKol(); 
  
    // create and start a timer that has been configured to trigger onTickEvents every 100 ms and run for 5000 ms
    //timer1 = CountdownTimerService.getNewCountdownTimer(this).configure(100, 5000).start();
    CountdownTimerService.getCountdownTimerForId(0).start();
    //timer0.start();
    //println("timer 0 started");

}

////////////////////
void draw_DUST() {

if(!CHANGESWITCH){
     
  pushMatrix();
       // STEADY PHOTO
      tint(255); 
      image(dustphoto,-5,-5);
          
     // MOVING PHOTO
      tint(255,random(60) + 190); 
      rr=int(random(2));    // set random vibration
      if(rr==0){
            rr=-1;
      } 
      image(dustphoto, rr*random(RVIB), rr*random(RVIB));
    
      
     // FADING IN PIC
      tint(255,fadin+1); 
      rr=int(random(2));    // set random vibration
      if(rr==0){
            rr=-1;
      } 
      image(fadepic,rr*random(RVIB), rr*random(RVIB));
      
        //if(TOG1){orbiteurs();}
  orbiteurs();
      popMatrix();    
  }
 
 
  if(TOG1){ dustMaker(); } // paints Dust starmap
  
  
}


/////////////////////////////////////////////////
void dustMaker(){
    if(int(random(200)) > 20){
     strokeWeight(1);
     starcolor = getKol();
     float rrr = starcolor.x / 2;
     float ggg = starcolor.y / 2;
     float bbb = starcolor.z / 2;   
     int neoX=-width/2 + int(random(width));
     int neoY =  -height/2 + int(random(height));
     stroke(rrr,ggg,bbb,20 + int(random(20)));
     circle(neoX,neoY,1);
     stroke(rrr,ggg,bbb,10 + int(random(10)));
     line(starpos.x, starpos.y, neoX, neoY);
     starpos.x = neoX;
     starpos.y = neoY;
     
   } 
  
}




////////////////////
void DustChangePix(){ 
  
  CHANGESWITCH=true;

  newpix = "/dustpix/dust-" + (dustpix.get(nextpic) +1) +".jpg";
  //println("newpix: " + newpix);
  dustphoto = loadImage(sketchPath + newpix);
  dustphoto.mask(maskImage);
  RVIB = int(random(2)+2);
  
   if(nextpic<(maxpix-1)){
      nextpic +=1;
  }else{
    nextpic = 1;
    dustpix.shuffle();
    ITER+=1;
    println("ITER: " + ITER);
  }
  
  pushMatrix();
  tint(255,0);
  //image(fadepic,-2000, -2000);
  fadin = 0;
  fadepic = loadImage(sketchPath + "/dustpix/dust-" + (dustpix.get(nextpic) +1)+".jpg");
  fadepic.mask(maskImage);
  popMatrix();
  
  CHANGESWITCH=false;

}

///////////////////
void trigDustOrbit(){

  dustorbits = new ArrayList<Dustorb>();
  orbcolor = getKol();   
 
  int totorbz=10+int(random(18));
  
  for(int i=1; i<=totorbz; i++){
    PVector ppp = new PVector(0,0);
    float randsize=random(2, 100);
    float randshrink = int(random(2, 10));
    float talfaspeed = random(1, 2.5);
    d = new Dustorb(ppp,randsize,2,talfaspeed);
    dustorbits.add(d);  
  }  
    
    println("trigDustOrbit called");
}

//////////////////////////////
PVector getKol(){ 
    int loc = int(random(dustphoto.width * dustphoto.height));
    // Get the R,G,B values from image
    float r = red   (dustphoto.pixels[loc]);
    float g = green (dustphoto.pixels[loc]);
    float b = blue  (dustphoto.pixels[loc]);   
    PVector kk = new PVector(r,g,b);
    return(kk);
}

///////////////////////////////
void orbiteurs(){

    if(dustorbits.size() > 0){ 
      for (int i = 0; i < dustorbits.size(); ++i) {
         if (dustorbits.get(i).isDead()) {
             dustorbits.remove(i);
         //println("tezorb["+i+"] is dead!");
          }else{
              dustorbits.get(i).move();
              dustorbits.get(i).display();
          }
        }
      }
}
