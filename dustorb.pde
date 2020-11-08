
// define class Dustorb
class Dustorb
{
 // PVector velocity = new PVector(random(-MAX_SPEED, MAX_SPEED), random(-MAX_SPEED, MAX_SPEED));
  float myspeed = 3;
  PVector velocity = new PVector(0, myspeed / 2.);
  PVector pos;
  PVector dustcolor;
  float sh;
  float size = 1;
  float talfa = 200;
  float talfaspeed = 2.;
  boolean direktion = true;
  
  
  // The Constructor is defined with arguments.
  Dustorb(PVector origin, float sz, float shrink, float talfasp)
  {
     size=sz;
     pos = origin;  
     sh = shrink;   
     talfaspeed = talfasp;
     int r=int(random(2));
     if(r>0){direktion=true;}else{direktion=false;}
     //println("dustorbits array size = " + dustorbits.size() + " pos.x:" + pos.x + " pos.y:" +pos.y); 
  }
  
  // method move
  void move()
  {
     //Apply velocity to particle
    //pos.add(velocity);    
     //Decrease size
    if(direktion){ size -= sh*talfaspeed; 
    }else{ size += sh*talfaspeed; }
      
    talfa -= sh/1.75;
  }
  
  // method display
  void display()
  {
    strokeWeight(2);
    int rr = int(orbcolor.x);
    int gg = int(orbcolor.y);
    int bb = int(orbcolor.z);
    stroke(rr,gg,bb,talfa);
    noFill();
    circle(pos.x, pos.y, int(size));
   
   //stroke(0,250,0,200);
   // circle(0, 0, int(99));
   // println("rr: " + rr +" gg: " +gg + " bb:" +bb);
 
  }
  
   // method isDead 
   boolean isDead()
    {
      if (size < 1) {
      return true;
    } else {
      return false;
    }
    
  }
  
}// end Dustorb class
