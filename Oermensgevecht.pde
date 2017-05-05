Bloem[] blommekes = new Bloem[15];
Kasteel kasteelb = new Kasteel(0,700,'b',500);
Kasteel kasteelr = new Kasteel(1300,700,'r',500);
Soldaat[] soldaten = new Soldaat[15];
//moveThread thread = new moveThread();


int timerl = 0;


/*TODO 


Maak een resetfunctie
Maak een eindscherm en beginscherm
Animeer de mennekes etc.



*/
void setup(){
  
 size(1600,800);
frameRate(60);

 int i = 0;
for (Bloem b : blommekes){
    blommekes[i] = new Bloem();
    i++;
  
}
soldaten[0] = new Soldaat(1300,700,'r',1);
soldaten[1] = new Soldaat(300,700,'b',1);
// soldaten[0].display();
 thread("moveThread");
 //thread.run(soldaten);
  
}

void draw(){
  int timer = millis();
  
  
  
  
  background(160,230,255);
  noStroke();
  fill(1,166,17);
  rect(0,700,1600,800); 
 


kasteelb.display();
kasteelr.display();

 for (Bloem b : blommekes){
    b.display();
}

 int i = 0;
 for (Soldaat s : soldaten){
   if(s !=null){
    
    soldaten[i].display();
    
   }
   i++;
}




//debug damage display and timer
//println("timer =", timer ,"timerl =", timerl);
//if (timer>timerl+1000){
//    kasteelr.damage(10);
//    timerl=timer;
//  }


 
}