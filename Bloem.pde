class Bloem{
  
  int x;
  int y=700;
  
  Bloem(){
    
    x=int(random(1600));    
  }
  
  
  void display(){
  //stokkie
  stroke(1,166,17);
  strokeWeight(5);
  line(x-25,y,x-25,y-30);
  
  //bloem
  noStroke();
  fill(255,255,0);
  ellipse(x-25,y-30,25,25);
  fill(200,0,0);
  
  ellipse(x-25,y-40,10,10);
  ellipse(x-25,y-20,10,10);
  
  ellipse(x-15,y-30,10,10);
  ellipse(x-35,y-30,10,10);
  
  ellipse(x-32,y-40,10,10);
  ellipse(x-18,y-20,10,10);
  
  ellipse(x-32,y-20,10,10);
  ellipse(x-18,y-40,10,10);
  }
}