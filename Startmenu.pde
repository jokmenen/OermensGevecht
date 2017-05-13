void setupStart(){
    cp5 = new ControlP5(this);
    startmenu = new StartMenu();
    keysActive = false; //toetsen uitschakelen
}

class StartMenu{

    boolean actief = true; 
    StartMenu(){
        cp5.addButton("Startgame")
            .setPosition(width/2-100,height/2-10)
            .setSize(200,20)
            .setLabel("Start game")
            .activateBy(ControlP5.RELEASE);
        ;
        cp5.addButton("Highscore")
            .setPosition(width/2-100,height/2+30)
            .setSize(200,20)
            .setLabel("High score")
            .activateBy(ControlP5.RELEASE);


    }

    boolean display(){
        noStroke();
        fill(100,100,100,220);
        rect(0,0,width,height);
        if (!actief){}
        return actief;

    }

    public void Startgame() {
        actief = false;
        cp5.remove("Startgame");
        cp5.remove("Highscore");

    }

    public void Highscore() {
        //println("boepiedoep");

    }


}