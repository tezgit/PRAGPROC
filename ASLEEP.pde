// ASLEEP MODULE
import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.flowfieldparticles.DwFlowFieldParticles;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwOpticalFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;



float sininc = 0.;
int h1, h2;
float h1inc, h2inc;
int px1, py1, px2, py2, px3, py3;
int ppr = 255;
int ppg = 255;
int ppb = 255;
boolean CRASH = false;
int crashradius = 5;
float rvel = 0.5;
int raycol = 0;

int rr1, rr2, rr3;
int smr1, smr2;
int cam_w = 720;
int cam_h = 720;

//Capture cam;

PGraphics2D pg_canvas;
PGraphics2D pg_obstacles;
PGraphics2D pg_cam; 

DwPixelFlow context;
DwOpticalFlow opticalflow;
DwFlowFieldParticles particles;

DwFlowFieldParticles.SpawnRect spawn = new DwFlowFieldParticles.SpawnRect();

///////////////////////////////////////////
void setup_ASLEEP(){
  
  FADER1 = 0;
  FADER2 = 0;
  FADER3 = 0;
  FADER4 = 0;
  TOG1 = true;
  TOG2 = false;
  TOG3 = false;
  TOG4 = false;
  
  
  h1=0;
  h2=0;
  h1inc = 1.25;
  h2inc = 2.72;
  
  sininc = random(0.1, 350.7);
  
  frigio = loadImage(sketchPath + "sleepix/frigio720.jpg");
  frigio.resize(100,100);
  geometrik = loadImage(sketchPath + "sleepix/geometrik-sf.png");
  geometrik.resize(300,300);
  geos = loadImage(sketchPath + "sleepix/geometrik-ss.png");
  geos.resize(260,250);
  star = loadImage("sleepix/star.png");
  star.resize(10,10);
  smoke = loadImage("sleepix/smoketexture.png");  
  aura = loadImage(sketchPath + "sleepix/aura.png");
  aura.resize(220,220);
  
    myMovie = new Movie(this, sketchPath + "sleepix/sleepwave720.mov");
    myMovie.loop();
    
   centerX = width/2 - cam_w/2;
   centerY = height/2 - cam_h/2;
   
     
    pg_cam = (PGraphics2D) createGraphics(cam_w, cam_h, P2D);
    pg_cam.smooth(0);
    pg_cam.beginDraw();
    pg_cam.background(0);
    pg_cam.endDraw();


    pg_canvas = (PGraphics2D) createGraphics(cam_w, cam_h, P2D);
    pg_canvas.smooth(0);
    
    int border = 20;
    pg_obstacles = (PGraphics2D) createGraphics(cam_w, cam_h, P2D);
    pg_obstacles.smooth(0);
    pg_obstacles.beginDraw();
    pg_obstacles.clear();
    pg_obstacles.noStroke();
    pg_obstacles.blendMode(REPLACE);
    pg_obstacles.rectMode(CORNER);
    pg_obstacles.fill(0, 255);
    pg_obstacles.rect(0, 0, cam_w, cam_h);
    pg_obstacles.fill(0, 0);
    pg_obstacles.rect(border/2, border/2, cam_w-border, cam_w-border);
    pg_obstacles.endDraw();
    
    
    // library context
    context = new DwPixelFlow(this);
    context.print();
    context.printGL();
    
    // optical flow 
    opticalflow = new DwOpticalFlow(context, cam_w, cam_h);
    opticalflow.param.grayscale = true;
    
    //border = 120;
    float dimx = cam_w  - border;
    float dimy = cam_h - border;

    
    int particle_size = 6; // 
    int numx = (int) (dimx / (0.9f*particle_size));
    int numy = (int) (dimy / (0.9f*particle_size));

    // particle spawn-def, rectangular shape
    spawn.num(numx, numy);
    spawn.dim(dimx, dimy);
    spawn.pos(cam_w/2-dimx/2, cam_h/2-dimy/2);
    spawn.vel(0, 0);
    
    // partcle simulation
    particles = new DwFlowFieldParticles(context, numx * numy);
    particles.param.col_A = new float[]{0.65f, 0.10f, 0.10f, 3};
    particles.param.col_B = new float[]{0.9f, 0.9f, 0.9f, 0};
 
    particles.param.shader_type = 1;
    particles.param.shader_collision_mult = 0.4f;
    particles.param.steps = 1;
    particles.param.velocity_damping  = 0.999f;
    particles.param.size_display   = ceil(particle_size * 1.5f);
    particles.param.size_collision = particle_size;
    particles.param.size_cohesion  = particle_size;
    particles.param.mul_coh = 0.20f;
    particles.param.mul_col = 1.00f;
    particles.param.mul_obs = 2.00f;
    particles.param.mul_acc = 0.10f; // optical flow multiplier
    particles.param.wh_scale_obs = 0;
    particles.param.wh_scale_coh = 5;
    particles.param.wh_scale_col = 0;
    
    // init stuff that doesn't change
    //particles.resizeWorld(width, height); 
    particles.resizeWorld(cam_w, cam_h); 
    //particles.spawn(width, height, spawn);
    particles.spawn(cam_w, cam_h, spawn);
    particles.createObstacleFlowField(pg_obstacles, new int[]{0,0,0,255}, false);
  
}

///////////////////////////////////////////
void draw_ASLEEP(){
  
   // if movie is running
  if(myMovie.width > 0){
      
      pg_cam.beginDraw();
      
      pg_cam.tint(255,255);
      pg_cam.image(myMovie,0,0);

  
    pushMatrix();
    if(random(2000)>1980){rr2=int(100+random(155));}
    pg_cam.tint(255,rr2);
    pg_cam.image(aura, 255,40);
    angle += 0.002;
    rotate(angle);
    popMatrix();
    
    if(random(200)>190){smr1=int(random(255));}
    if(random(200)>190){smr2=int(random(255));}
   
     pushMatrix();
     smokesystem(300,255); // smoke over the Geometrik chimneys
     smokesystem(408,283);
     popMatrix();
     

    if(random(20)>17){rr1=int(80+random(50));}
    pg_cam.tint(255,rr1);
    pg_cam.image(geos, 220,220); // glow geometrik
    pg_cam.tint(255,255);
    pg_cam.image(geometrik, 200,212); // logo geometrik
    pg_cam.tint(255,150);
    pg_cam.image(pragma,325,105); // logo pragma
    

    
    if(random(20)>5){rr3=int(80+random(50));}
    pg_cam.tint(255,rr3);
    pg_cam.image(star,500,150); // star 1    
    
     
    // GATE 
    pg_cam.tint(255,FADER4 * 255);// fader4 is set via OSC
    pg_cam.image(gate,0,0);
    // BLACKY CIRCLE
    pg_cam.fill(0,0,0,FADER3 * 255); // fader4 is set via OSC
    pg_cam.noStroke();
    pg_cam.circle(pg_cam.width/2, pg_cam.height/2, cam_w + 10);

 
    
             // VISUALIZE TEZUFOs
    if(Ufobjects.size() > 0){ 
        for (int i = 0; i < Ufobjects.size(); ++i) {
            Ufobjects.get(i).move();
            Ufobjects.get(i).display();
            if (Ufobjects.get(i).isDead()) {
             Ufobjects.remove(i);
             //println("Ufobjects["+i+"] is dead!");
              }
          }    
     }     
 
      
        pg_cam.endDraw();
  
      
      // apply any filters
      DwFilter.get(context).luminance.apply(pg_cam, pg_cam);

      // compute Optical Flow
      opticalflow.update(pg_cam);
     
      
    } // END IF MOVIE
    
    float mds=(mouseX/10.); // 7.2
    mds = 7.2;
    particles.param.size_display = int(mds);
   
   
    particles.param.timestep = 1f/frameRate;
    
    // update particles, using the opticalflow for acceleration
    particles.update(opticalflow.frameCurr.velocity);
    
    // render obstacles + particles
    pg_canvas.beginDraw(); 
    //pg_canvas.image(pg_cam, 0, 0, width, height);
    pg_canvas.image(pg_cam, 0, 0, cam_w, cam_h);
    pg_canvas.image(pg_obstacles, centerX, centerX);     
    pg_canvas.endDraw();
    
    
    particles.displayParticles(pg_canvas);

     
    // display result
    pg_canvas.mask(maska);
    image(pg_canvas, 0, 0);

    //String txt_fps = String.format(Locale.ENGLISH, "[%s]   [%7.2f fps]   [particles %,d] ",  getClass().getSimpleName(), frameRate, particles.getCount() );
    //surface.setTitle(txt_fps);
  
   if(TOG1){ Mony();} // TOG1 is set via OSC
}



///////////////////////////////////////////
void Mony(){
    if(sininc < 360){ sininc += 0.008; } // 0.002
    else{sininc = 0;}
    //fill(255, 255, 255, 10);

      noStroke(); 
       
       px1=int(myMovie.width/2*sin(sininc));
       py1 =int(myMovie.width/2*cos(sininc));
       px2=int(myMovie.width/2*cos(sininc*rvel));
       py2 =int(myMovie.width/2*sin(sininc*rvel));
      

    //if( (int(px1)==int(px2)) && (int(py1)==int(py2))){
    if(abs(px1-px2)< crashradius  && abs(py1-py2)<5){
      CRASH = !CRASH;
      crashradius = 1;
      rvel = 0.5; // + ((random(10)+1)/10.);
      sininc += (int(random(12)+7))/1000.;
      
      if(CRASH){
          ppr = 255;
          ppg = 255;
          ppb = 255;         
          trigRadars();
          raycol = 1;
          OSCout("/radar", 1);
          //rvel = random(1.1, 2.7);
          
      }else{
          ppr = 220;
          ppg = 0;
          ppb = 0;
          trigRadars();
          raycol = 0;
          OSCout("/radar", 0);
          //rvel = random(1.1, 2.7);
      }
        
    }else{
      crashradius = 5;
    }
    
    
    fill(ppr, ppg, ppb, 100  * FADER1);
    circle(px1, py1, 18); 
    circle(px2, py2, 18); 

 
    beginShape();
    smooth();
    stroke(255,255,255,60 * FADER1);
    //fill(255, 255, 255, 10);
    strokeWeight(1); 
    //vertex(px1, py1); // first point
    //line(px1, py1, px2, py2);
    if(h1<-height/2){h1inc=(h1inc*-1);}
    else if(h1>height/2){h1inc=(h1inc*-1); h1inc=random(0.7, 2.7) * -1;}
    h1+=h1inc;
    if(h2<-height/2){h2inc=(h2inc*-1); h1inc=random(0.7, 2.4) * -1;}
    else if(h2>height/2){h2inc=(h2inc*-1);}
    h2+=h2inc;
    line(width/2, h1, px1, py1);
    line(width/2, h1, px2, py2);
    line(-width/2, h2, px1, py1);
    line(-width/2, h2, px2, py2);
    endShape();
    
    // VISUALIZE TEZORBITS
    if(tezorbits.size() > 0){ 
        for (int i = 0; i < tezorbits.size(); ++i) {
            tezorbits.get(i).move();
            tezorbits.get(i).display();
            if (tezorbits.get(i).isDead()) {
             tezorbits.remove(i);
             //println("tezorb["+i+"] is dead!");
              }
          }    
     }
     


}

///////////////////////////////////////////
void trigRadars(){
   int rays=int(random(2, 10));
   raycol=int(random(2));
   
    PVector ppp = new PVector(px1, py1);
    PVector ttcolor = new PVector(0, 0, 0);
    
   for(int i=1; i<=rays; i++){
    //PVector ppp = new PVector(px1, py1);
    int randsize=int(random(2, 100));
    int randshrink = int(random(2, 10));
      
    if(int(random(2))==1){
      ttcolor.x = 200;
      ttcolor.y = 200;
      ttcolor.z = 200;      
    }else{
      ttcolor.x = 250;
      ttcolor.y = 0;
      ttcolor.z = 0;
    }
    
    t = new Tezorb(ppp,randsize,2,ttcolor);
    tezorbits.add(t);  
  }      
} 

///////////////////////////////////////////
void trigRay(){
  
  int rr = int(random(5)) + 3;
   for(int i=1; i<=rr; i++){
      PVector ppp = new PVector(px1, py1);
      int us=int(random(2, 100));
      int ur = int(random(2, 10));
      u = new Ufobj(ppp,us,ur); 
      Ufobjects.add(u);    
  }
} 



//////////////////////////
void smokesystem(int xx, int yy){   
  int rix = int(random(1)) +1;
  int riy = int(random(5)) +1;
  int rr = int(random(50)) +120;
  int si = int(random(5)) +1;

  for (int i = 0; i < int(random(10)+1); i++) {
      pg_cam.tint(255,rr);
      
      float sigx = random(2) -1; 
      if (sigx > 0) { rix = rix*1;}else{ rix = rix *-1;}
      float sigy = random(2) -1; 
      if (sigy > 0) { rix = riy*1;}else{ rix = riy *-1;}

      int rez=int(random(20)+1);
      smoke.resize(20,20);
      pg_cam.image(smoke,xx+rix,yy);
    }       
}
