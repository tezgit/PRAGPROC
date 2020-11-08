ArrayList<Tezorb> tezorbits = new ArrayList<Tezorb>();
// create an object of class Tezorb
Tezorb t;

// define class Tezorb
class Tezorb
{
 // PVector velocity = new PVector(random(-MAX_SPEED, MAX_SPEED), random(-MAX_SPEED, MAX_SPEED));
  float myspeed = 3;
  PVector velocity = new PVector(0, myspeed / 2.);
  PVector pos;
  PVector orbcolor;
  float sh;
  float size = 1;
  float talfa = 100;
  boolean direktion = true;
  float alfaktor = 3.0;
  
  
  // The Constructor is defined with arguments.
  Tezorb(PVector origin, float sz, float shrink, PVector tcolor)
  {
     size=sz;
     pos = origin;  
     orbcolor = tcolor;
     sh = shrink;   
     alfaktor = random(1.1, 4.4);
     int r = int(random(2));
     if(r>0){direktion=true;}else{direktion=false;}
     //println("tezorbits array size = " + tezorbits.size()); 
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
    //smooth();
    noFill();
    stroke(orbcolor.x,orbcolor.y,orbcolor.z,talfa);
    circle(pos.x, pos.y, int(size));

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
  
}// end Tezorb class
