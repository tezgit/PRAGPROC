// SELK MODULE
private TimedEventGenerator SelkImageTimer;
private TimedEventGenerator AfroImageTimer;

float elapsedTime;
float lasttimecheck, timeinterval;


int sfercirkalfa = 250;
int sferlinealfa = 250;
int afdist = 450;
int maxafpix = 36;

//IntList[] aflists;
IntList aflist1;
IntList aflist2;
IntList aflist3;
IntList aflist4;

IntList selkpix;


/////////////////////////
void setup_SELK() {
   
  newpix = "";
  maxpix = 29;
  nextpic = 0;
  
  TOG1 = false;
  
  int i = 0;
  
  angle = int(random(360));
  
  // shuffle selkpix
  selkpix = new IntList(); 
  for(i=0; i<maxpix;i++){
    selkpix.append(i);
  }
  selkpix.shuffle();
 
  aflist1 = new IntList(); 
  for(i=0; i<maxafpix;i++){
    aflist1.append(i+1);
  }
  aflist1.shuffle();
  
    aflist2 = new IntList(); 
  for(i=0; i<maxafpix;i++){
    aflist2.append(i+1);
  }
  aflist2.shuffle();
  
    aflist3 = new IntList(); 
  for(i=0; i<maxafpix;i++){
    aflist3.append(i+1);
  }
  aflist3.shuffle();
  
    aflist4 = new IntList(); 
  for(i=0; i<maxafpix;i++){
    aflist4.append(i+1);
  }
  aflist4.shuffle();
  
  
  int rr=int(random(20)+1);
  photo = loadImage(sketchPath + "selkpix/s-" + int(selkpix.get(0)) + ".jpg");
  maskImage = loadImage(sketchPath + "selkpix/maska720.jpg");
  photo.mask(maskImage);
  //gateframe = loadImage(sketchPath + "selkpix/gateframe.png");
  afropix[0] = loadImage(sketchPath + "afpix/AF-" + int(aflist1.get(0)) + ".jpg");
  afropix[1] = loadImage(sketchPath + "afpix/AF-" + int(aflist2.get(0)) + ".jpg");
  afropix[2] = loadImage(sketchPath + "afpix/AF-" + int(aflist3.get(0)) + ".jpg");
  afropix[3] = loadImage(sketchPath + "afpix/AF-" + int(aflist4.get(0)) + ".jpg");

  SelkImageTimer = new TimedEventGenerator(this, "onChangeSelkPix", true);
  SelkImageTimer.setIntervalMs(5000);
 
  AfroImageTimer = new TimedEventGenerator(this, "onChangeAfroPix", true);
  AfroImageTimer.setIntervalMs(1000);  
  
  lasttimecheck = millis();
  timeinterval = 1000;

  
}

////////////////////
void draw_SELK() {
  
  angle += 0.0008; 
  
  pushMatrix();  
  imageMode(CENTER);
  rotate(angle);
  
  // STEADY PHOTO 
  image(photo, 0,0);
  
  if(TOG1){drawTriangles();}
  
  // MOVING PHOTO
  int rr=int(random(2)); 
  if(rr==0){
    rr=-1;
  }
  image(photo, rr*random(5) -2, rr*random(5)-5); 

  popMatrix();

  pushMatrix();  
  rotate(-angle);
  image(afropix[0], -afdist, 0); 
  image(afropix[1], 0, -afdist); 
  image(afropix[2], afdist, 0); 
  image(afropix[3], 0, afdist);      
  popMatrix();

  
  if(millis() > lasttimecheck + timeinterval){
    lasttimecheck = millis();
    // action here
    //onChangeAfroPix();
  }
  
}


////////////////////
//void onFinishEvent(CountdownTimer t) {
void onChangeSelkPix(){  
   if(nextpic<maxpix){
      nextpic +=1;
  }else{
    nextpic = 0;
    selkpix.shuffle();
  }
  
  newpix = "selkpix/s-" + (selkpix.get(nextpic) +1)+".jpg";
  println("newpix: " + newpix);
  photo = loadImage(sketchPath + newpix);
  photo.mask(maskImage);

  SelkImageTimer.setEnabled(true);
  int neotime=int(random(12)+1) * 3000;
  SelkImageTimer.setIntervalMs(neotime);

}

////////////////////
void onChangeAfroPix(){  
  int rr = 0;
  
  rr = int(random(maxafpix));
  afropix[0] = loadImage(sketchPath + "afpix/AF-" + int(aflist1.get(rr)) + ".jpg");
  rr = int(random(maxafpix));
  afropix[1] = loadImage(sketchPath + "afpix/AF-" + int(aflist2.get(rr)) + ".jpg");
  rr = int(random(maxafpix));
  afropix[2] = loadImage(sketchPath + "afpix/AF-" + int(aflist3.get(rr)) + ".jpg");
  rr = int(random(maxafpix));
  afropix[3] = loadImage(sketchPath + "afpix/AF-" + int(aflist4.get(rr)) + ".jpg");
  
  AfroImageTimer.setEnabled(true);
  int neotime=int(random(2)+1) * 1000;
  AfroImageTimer.setIntervalMs(100);
  
}

  

////////////////////
void drawTriangles(){ 
      int rm = 5;
      int margin = 25;
      int trialfa = 250;
      strokeWeight(1);    
      fill(130, 130, 130, sfercirkalfa);
      noStroke(); 
      int px1=int((-photo.width/2 +margin)*sin(angle*10));
      int px2=int((-photo.width/2 +margin)*sin(angle*7));
      int px3=int((-photo.width/2 +margin)*sin(angle*5));
      int py1 =int((-photo.width/2 +margin)*cos(angle*10));
      int py2 =int((-photo.width/2 +margin)*cos(angle*7));
      int py3 =int((-photo.width/2 +margin)*cos(angle*5));
      //circle(px1, py1, 30); 
      //circle(px2, py2, 40); 
      //circle(px3, py3, 20);  
      stroke(130,130,130,sferlinealfa);
      
      //line(px1,py1,px2,py2);
      //line(px2,py2,px3,py3);
      //line(px1,py1,px3,py3);
      
      //fill(90, 90, 90, sfercirkalfa);
      noStroke(); 
      int px4=int((-photo.width/2 +margin)*cos(angle*9));
      int py4=int((-photo.width/2 +margin)*sin(angle*9));
      //circle(px4, py4, 15); 
      stroke(130,130,130,sferlinealfa);
      //line(px4,py4,px3,py3);
      //line(px4,py4,px2,py2);
      //line(px4,py4,px1,py1);
      
      beginShape();
      noStroke(); 
      fill(230, 0, 0, random(rm)+trialfa);
      triangle(px1, py1, px2, py2, px3, py3);
      fill(30, 30, 30, random(rm)+trialfa);
      triangle(px4, py4, px2, py2, px3, py3);
      fill(230, 230, 230, random(rm)+trialfa);
      triangle(px4, py4, px2, py2, px1, py1);
      endShape();
}
