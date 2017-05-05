void moveThread() {
     while(true){
        delay(1);
        int i = 0;
       for (Soldaat s : soldaten){
   if(s !=null){
     if (s.dood == true){soldaten[i] = null;}else{
     s.move(soldaten,kasteelr,kasteelb);
        
     }
     i++;
   }
     }
        
     }
  
}