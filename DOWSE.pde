float fp_angle = 0;
int fpnum = 0;

/////////////////////////////////
void setup_DOWSE(){
  
  fp1 = loadImage(sketchPath + "/dowsepix/FP1.jpg");
  fp2 = loadImage(sketchPath + "/dowsepix/FP2.jpg");
  fp3 = loadImage(sketchPath + "/dowsepix/FP3.jpg");
  fp0 = loadImage(sketchPath + "/dowsepix/OPT-0.jpg");

  maskImage = loadImage(sketchPath + "/dowsepix/maskaW720.jpg");
  fp1.mask(maskImage);
  fp2.mask(maskImage);
  fp3.mask(maskImage);
  fp0.mask(maskImage);

 
}

/////////////////////////////////
void draw_DOWSE(){

  if (degrees(fp_angle) <360 * 100){
  fp_angle += 0.015;
  }else{
   fp_angle=0;  
     //if(fpnum<3){
     //  fpnum++;
     //}else{
     //  fpnum=1;
     //}
     
  }
  
  pushMatrix();
  smooth(4);
    rotate(fp_angle);
    imageMode(CENTER);
    if(fpnum == 1){
      image(fp1,0,0);
    }else if(fpnum == 2){
      image(fp2,0,0);  
     }else if(fpnum == 3){
      image(fp3,0,0);  
     }else if(fpnum == 0){
      image(fp0,0,0);  
     }    
  popMatrix();  
  
  
  //text("fp_angle: " + degrees(fp_angle), -width/2 + 10, -height/2 + 10);
 
 
}
