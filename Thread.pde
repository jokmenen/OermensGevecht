


void moveThread() {
    int timer = millis();
    int timerl = millis();
    int counter = 0;

    while(true){
        
                delay(1); //else processing crashes due to mem problems
                int i = 0;
                for (Soldaat s : soldaten){
                  i++;
                    if(s !=null){
                        if (s.dood == true){
                          soldaten[i-1] = null;
                        }
                        else{//note 10 mei: moved from internal timer to class timer
                            if (true){
                                s.move(soldaten,kasteelr,kasteelb);
                            }
                        }
                        
                       // if (counter >100){counter = 0;}
                    }
                }

            }
}