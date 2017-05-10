boolean addSoldaat(char rb,int type){
   println("henkie");
  int x;
  int y = 700;//grasniveau
  if (rb== 'r'){x=1300;}else{x=300;}//bepaal spawnplaats
  
  int iterator=0;
  boolean alGevuld = true;
  while(iterator < maxSoldaten&&alGevuld==true){
    
    if(soldaten[iterator] == null){
      println(iterator);
      soldaten[iterator]= new Soldaat(x,y,rb,type);
      alGevuld = false;
     
      
    }else{ 
      iterator = iterator+1;
      alGevuld = true;}
    
  }
  
  return alGevuld;
  
}