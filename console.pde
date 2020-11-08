// Console vars
String[] cons = {">",">",">",">",">",">",">",">"};
boolean console = false;
int consindex = 0;
boolean DEBUG = false;

////////////////////////////////////////////
void showConsole(){
  translate(0,0);
  noStroke();
  fill(0, 40, 90, 70); 
  rect(-width/2,height/2-100,width,100);
  int cs=cons.length - 1;
  PFont fonty;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  fonty = createFont("COURIER.TTF", 12);
  textFont(fonty);

  //stroke(0,255,0);
  fill(0, 200, 90, 200); 
  textSize(14); 
  int ctop=height/2-100;
  int cright=-width/2 + 20;
  text(cons[0] , cright, ctop + 20); 
  text(cons[1] , cright, ctop + 40); 
  text(cons[2] , cright, ctop + 60); 
  text(cons[3] , cright, ctop + 80); 
   
}
//////////////////////////////////////////
void cons(int cline, String mystring){
 // consindex++;
 // consindex=consindex % 8;
  consindex = cline -1;
  cons[consindex]= "> " + mystring;
  // println(cons[consindex]);
  
  // clear
  if(cline==0 || mystring=="clear"){
    for(int i=0; i<8;i++){
      cons[i] = ">> ";
    }
  }
  
}

////////////////////////////////
