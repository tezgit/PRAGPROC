ArrayList<Ufobj> Ufobjects = new ArrayList<Ufobj>();
// create an object of class Ufobj
Ufobj u;

// define class Tezorb
class Ufobj
{
 // PVector velocity = new PVector(random(-MAX_SPEED, MAX_SPEED), random(-MAX_SPEED, MAX_SPEED));
  float myspeed = 3;
  PVector velocity = new PVector(0, myspeed / 2.);
  PVector pos;
  float sh;
  float size = 1;
  float talfa = 100;
  boolean direktion = true;
  float alfaktor = 3.0;
  
  
  // The Constructor is defined with arguments.
  Ufobj(PVector origin, float sz, float shrink)
  {
     size=sz;
     pos = origin;  
     sh = shrink;   
     alfaktor = random(1.1, 4.4);
     int r=int(random(2));
     if(r>0){direktion=true;}else{direktion=false;}
  }
  
  // method move
  void move()
  {
     //Apply velocity to particle
    //pos.add(velocity);    
     //Decrease size
    if(direktion){ size -= sh/alfaktor; 
    }else{ size += sh/alfaktor; }
      
    talfa -= sh/7.7;
  }
  
  // method display
  void display()
  {
    smooth();
    if(raycol>0){strokeWeight(20); stroke(200,200,200,talfa);}
    else{strokeWeight(25); stroke(250,0,0,talfa);}
    int nx=pg_cam.width/2;
    int ny=pg_cam.height/2;
     
    pg_cam.stroke(255,255,255,talfa);
    pg_cam.strokeWeight(5);
    pg_cam.line(nx+px2, nx+py2, nx, ny-220);
    pg_cam.tint(255,255);
    //pg_cam.image(frigio, pg_cam.width/2, pg_cam.height/2);

    //pg_cam.line(px1, py1, px2, py2);
    

  }
  
   // method isDead 
   boolean isDead()
    {
      if (talfa < 1) {
      return true;
    } else {
      return false;
    }
    
  }
  
}// end Ufobj class
