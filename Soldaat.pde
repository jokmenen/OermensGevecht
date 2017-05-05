class Soldaat{ 

int x;
int y;
int rechterpunt;
int maxhp;
int hp;
int damage;
int reach;
char roodBlauw;
int speed;
int typeSoldaat = 1; //farmer (1), knight (2), knight on horse (3)

int s_timer;
int s_timerl;

Soldaat(int xpos,int ypos, char rb,int type){
   x= xpos;
   y= ypos;
   roodBlauw = rb;
   typeSoldaat = type;
   switch (typeSoldaat){
case 1 :
  damage = 10;
  maxhp = 50;
  speed =10;
  rechterpunt = 50;
  reach = 10;
  break;
case 2 :
  damage = 25;
   maxhp = 75;
   speed = 100;
   rechterpunt = 50;
   reach = 10;
 break;
case 3 :
  damage = 50;
   maxhp = 100;
   speed = 150;
   rechterpunt = 100;
   reach = 10;
 break;
default:
  println("ERROR, BAD SOLDIER TYPE");
  damage = 10;
  maxhp = 50;
 
 }
 
 hp = maxhp;
 
}

boolean checkFriendly(Soldaat s){
  if (s.roodBlauw == this.roodBlauw){return true;}
    else{return false;}
}

boolean checkFriendly(Kasteel s){
  if (s.roodBlauw == this.roodBlauw){return true;}
    else{return false;}
}
 
int doDamage(){return damage;}
void getDamage(int damage){hp= hp-damage;}


void move(Soldaat[] soldaten, Kasteel rood, Kasteel blauw){
  
  int timer = 0;
  int timerl = millis();
  
 
  while (timer<(timerl+(20-(speed/10)))){
    timer = millis();
    //println(timer);
    //println((timerl+(1000-speed)));
   delay(1); 
   //println("while" + timerl);
  }
  
  
  
  
  
  
  //check if any soldaat in array soldaten from the other team is within 10 pixels and do damage if so
  boolean collision = false;
  
  
  
  for (Soldaat s : soldaten){
    if (s != null){
      println((abs(this.x-s.x)));
      println(this.roodBlauw);
  
 //if ((this.roodBlauw == 'r'&&abs(this.x-s.rechterpunt)<reach)||(this.roodBlauw == 'b'&&abs(s.x-this.rechterpunt)<reach)) 
    
    if (((this.x-s.rechterpunt)<500)||(abs(s.x-this.rechterpunt)<50)){
      collision = true;
      if (checkFriendly(s)) {s.getDamage(doDamage());}
    }
    }
    
}
//check if the other castle is within 10 pixels and do damage
if (this.roodBlauw == 'r'&&abs(this.x-blauw.rechterpunt)<reach){
      collision = true;
      blauw.getDamage(doDamage());
      if (checkFriendly(blauw)) {blauw.getDamage(doDamage());}
    } else if(this.roodBlauw == 'b'&&abs(rood.x-this.rechterpunt)<reach){
      collision = true;
      rood.getDamage(doDamage());
      if (checkFriendly(rood)) {rood.getDamage(doDamage());}
    }
  
  while (timer<(timerl+(speed+800))&&collision==true){
    timer = millis();
    //println(timer);
    //println((timerl+(1000-speed)));
   delay(1); 
   //println("while" + timerl);
  }
  
  
  if (collision==false){
    if(this.roodBlauw == 'b'){        x = x+1;}
    else if (this.roodBlauw == 'r'){  x = x-1;}
}
  
  
}

void display(){ //moet nog een echte soldaat worden
float healthbarsize;
switch (typeSoldaat){
case 1 :
  fill(0);
  rect(x,y,rechterpunt,-100);
  healthbarsize = (50*hp/maxhp);
  break;
case 2 :
  healthbarsize = (50*hp/maxhp);
  break;
case 3 :
  healthbarsize = (100*hp/maxhp);
  break;
default:
println("ERROR, BAD SOLDIER TYPE");
  fill(0);
  rect(x,y,50,-100);
  healthbarsize = (50*hp/maxhp);
 break;
 }
 
 
 if (roodBlauw == 'r'){
    fill(255,0,0);
    
  }else if (roodBlauw == 'b'){
    fill(0,255,0);
  }
 //hpbar
  stroke(0);
  strokeWeight(2);
  rect(x,y-150,healthbarsize,10);
  //println(hp/maxhp);
}
  
  
}