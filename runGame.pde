void runGame(boolean startMenuActief){ //actief = demo op achtergrond runnen (controls disabled), anders echte spel

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

  timer();
}