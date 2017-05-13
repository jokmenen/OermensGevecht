void setupGame(){



    int i = 0;
    for (Bloem b : blommekes){
        blommekes[i] = new Bloem();
        i++;

    }
   // soldaten[0] = new Soldaat(1300,700,'r',1,1);
   // soldaten[1] = new Soldaat(250,700,'b',1,2);
    // soldaten[0].display();
    thread("moveThread");
    saR = new SoldaatAdder();
    saR.start();
    saB = new SoldaatAdder();
    saB.start();
    
    //thread.run(soldaten); 
}