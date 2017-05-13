class SoldaatAdder extends Thread{
  boolean bezig = false;
  char i_rb;
  int i_type;
 void run(){
  while(true){
   if (bezig ==true){
     addSoldaat(i_rb,i_type);
     bezig = false;
   }
   delay(1);
  }
 }
 
 void insertSoldaat(char rb,int type){
    i_rb=rb;
    i_type=type;
    bezig = true;
  }
 
 boolean addSoldaat(char rb,int type){
    //println("henkie");
    int wait =0; //delay until unit is spawned
    int x;
    int y = 700;//grasniveau
    if (rb== 'r'){x=1300;}else{x=250;}//bepaal spawnplaats
    
    switch(type){
     case 1:
       wait = 1000;
       break;
     case 2:
       wait = 2000;
       break;
     case 3:
       wait = 3000;
       break;
    }
    
    while (wait>0){
     delay(1); 
     wait--;
    }

    int iterator=0;
    boolean alGevuld = true;
    while(iterator < maxSoldaten&&alGevuld==true){

        if(soldaten[iterator] == null){
            //println(iterator);
            soldaten[iterator]= new Soldaat(x,y,rb,type,iterator);
            alGevuld = false;


        }else{ 
            iterator = iterator+1;
            alGevuld = true;}

    }

    return alGevuld;

}
}