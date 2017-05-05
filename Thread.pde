void moveThread() {
     while(true){
        delay(1);
        
       for (Soldaat s : soldaten){
   if(s !=null){
   
     s.move(soldaten,kasteelr,kasteelb);
        
     }
     
   }
     }
        
    
  
}