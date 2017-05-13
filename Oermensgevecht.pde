/*TODO 

  - sodlier pikeman cannon
  Q W E  Player 1
  I O P  Player 2


  friendlyreach
  damage multipliers (armor etc)
  extra level
  Maak een resetfunctie
  Maak een eindscherm en beginscherm
  Animeer de mennekes etc.
  


  Note 10 mei: damage moet naar buiten soldaat omdat hij ander bottlenecked
 */

//Includes:
import controlP5.*; 

//Var declarations
Bloem[] blommekes = new Bloem[15];
Kasteel kasteelb = new Kasteel(0,700,'b',500);
Kasteel kasteelr = new Kasteel(1300,700,'r',500);
int maxSoldaten = 10;
Soldaat[] soldaten = new Soldaat[maxSoldaten];
boolean keysActive;
//moveThread thread = new moveThread();
int timerl = 0;
ControlP5 cp5;
StartMenu startmenu;
Timer timer;
SoldaatAdder saR;
SoldaatAdder saB;

void setup(){

    //Moet bij setup()
    size(1600,800);
    frameRate(60);
    
    setupGame();
    setupStart();

    //println(this);
}

void draw(){




    if (startmenu.actief){ //Als het startmenu aan staat moet het spel nog niet draaien.
        runGame(true);
        startmenu.display();

    } else {runGame(false);}

}

public void Startgame() {
    startmenu.Startgame(); // verwijder knoppen en gui
    //reset game met controls aan
    keysActive = true;
    //println("keyactivetrue");
}

public void Highscore() {
    startmenu.Highscore();
}