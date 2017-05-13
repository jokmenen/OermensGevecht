class Kasteel{
    int hp;
    int maxhp;
    int rechterpunt;
    int w = 300;
    int x=0;
    int y=700;
    char roodBlauw;

    Kasteel(int xpos,int ypos, char rb,int mhp){
        x= xpos;
        y= ypos;
        roodBlauw = rb;
        hp = mhp;
        maxhp = mhp;
        rechterpunt = w+x;
    }


    void dood(){}

    void getDamage(int d){

        if (hp>0){
            hp = hp - d;
        }else{
            dood();
        }

    }

    void display(){

        fill(160);
        noStroke();
        //kasteel
        rect(x,y,w,-300);
        //toren
        rect(x+75,y,150,-500);

        //dak
        fill(130,0,0);
        triangle(x+75,y-500,x+150,y-600,x+225,y-500);

        //poort
        fill(202,88,12);
        ellipse(x+150,y-100,150,100);
        rect(x+75,y,150,-100);

        //raam
        fill(0);
        ellipse(x+150,y-400,75,-100);
        rect(x+112.5,y-400,75,75);

        //vlag
        stroke(202,88,12);
        line(x+150,y-600,x+150,y-680);
        noStroke();
        if (roodBlauw == 'r'){
            fill(255,0,0);
            triangle(x+149,y-620,x+151,y-680,x+100,y-650);
            fill(255,0,0);

        }else if (roodBlauw == 'b'){
            fill(0,0,255); 
            triangle(x+151,y-620,x+151,y-680,x+200,y-650);
            fill(0,255,0);
        }

        //HP display;
        stroke(0);
        strokeWeight(2);

        float healthbarsize = (300*hp/maxhp);
        rect(x,y-200,healthbarsize,20);

    }
}
