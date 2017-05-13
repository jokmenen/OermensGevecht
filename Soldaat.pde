class Soldaat{ 
    int id;
  
    float x;
    float y;
    float w;
    float l;
    float rechterpunt;
    int maxhp;
    int hp;
    int damage;
    int reach;
    char roodBlauw;
    boolean dood = false;
    float speed;
    int wait;
    float attackSpeed;
    float attackDelay = 500; //const
    int typeSoldaat = 1; //farmer (1), knight (2), knight on horse (3)

    int s_moveTimer;
    int s_damageTimer;
    int soldaatnummer;

    Soldaat(float xpos,float ypos, char rb,int type,int t_id){
        
        id = t_id;//give the soldier an id
        
        x= xpos; //set start position x
        y= ypos; //''
        roodBlauw = rb; //set side
        typeSoldaat = type; //assign the type
        switch (typeSoldaat){ //give appropriate stats for type
            case 1 :
                damage = 15;//n
                maxhp = 50;//n
                speed = 30;//n
                w = 50;
                reach = 10;//n
                attackSpeed = 50;//n
                break;
            case 2 :
                damage = 5;//-
                maxhp = 30;//-
                speed = 70;//+
                w = 50;
                reach = 10;//n
                attackSpeed = 90;//+
                break;
            case 3 :
                damage = 20;//+
                maxhp = 50;//n
                speed = 20;//-
                w = 100;
                reach = 300;//+
                attackSpeed = 40;//-
                break;
            default:
                println("ERROR, BAD SOLDIER TYPE");
                damage = 10;
                maxhp = 50;

        }

        hp = maxhp;

    }

    boolean checkFriendly(Soldaat s){
        if (s.roodBlauw == this.roodBlauw){return true;}
        else{return false;}
    }

    boolean checkFriendly(Kasteel s){
        if (s.roodBlauw == this.roodBlauw){return true;}
        else{return false;}
    }

    int doDamage(){return damage;}
    void getDamage(int damage){

        if (hp-damage>0){hp= hp-damage;}
        else {dood = true;}


    }
    
    void timerIncrease(int millisec){
      s_moveTimer += millisec;
      //println(s_moveTimer);
      s_damageTimer += millisec;
    }
    
    boolean checkDamageTimer(){
      return s_damageTimer > int(attackDelay*(1-(attackSpeed/100)));
    }
    
    
     boolean k_checkCollision(Kasteel rood, Kasteel blauw){
       //check if 1) the other castle 2) is within 10 pixels
                  if (this.roodBlauw == 'r'&&abs(this.x-blauw.rechterpunt)<reach){ 
                    println("Castle in reach");
                     
                    if (checkDamageTimer()) { //do damage if ready
                        blauw.getDamage(doDamage());
                        s_damageTimer = 0; 
                    }
                    return true;
                  }
                    
                    
                  else if(this.roodBlauw == 'b'&&abs(rood.x-this.rechterpunt)<reach){ //roodblauw check nodig voor collision met friendlies maar zonder damage
    
                      if (checkDamageTimer()) { //do damage if ready
                        rood.getDamage(doDamage());
                        s_damageTimer = 0; 
                    }
                    return true;
                  }
                  return false;
     }
    
    boolean s_checkCollision(Soldaat s){
      
      //check if any soldaat in array soldaten from the other team is within 10 pixels and do damage if so but wait for timer
      
   
   
  // if (roodBlauw=='r'&&(s.roodBlauw=='r'&&
   
      
                    if ((roodBlauw=='r'&&(abs(this.x-s.rechterpunt)<=reach||
                        (s.roodBlauw=='r'&&this.x<s.rechterpunt&&this.x>s.x)))||
                        (roodBlauw=='b'&&(abs(s.x-this.rechterpunt)<=reach||
                        (s.roodBlauw=='b'&&this.rechterpunt>s.x&&this.rechterpunt<s.rechterpunt)))){
                    //||
                    //    (roodBlauw=='r'&&abs(this.x-s.x)<=reach)||
                    //    (roodBlauw=='b'&&abs(s.x-this.x)<=reach))
                        
                        
                        //red looks with x, blue looks with rechterpunt
                       // if((roodBlauw=='r'&&!(x> s.x-reach || x > s.rechterpunt+reach))||
                        //(roodBlauw=='b'&&rechterpunt< s.x-reach && rechterpunt > s.rechterpunt+reach)){
                        
                        println(roodBlauw+str(s_damageTimer)+id);
                        if (!checkFriendly(s)&&checkDamageTimer()) {
                           //println("Boop");
                        s.getDamage(doDamage());
                        s_damageTimer = 0; 
                      }
                      return true;
                    }
      
                  return false;

    


    }

    void move(Soldaat[] soldaten, Kasteel rood, Kasteel blauw){
      
     boolean collision = false;
      

//check for collision (if no) --> is it time to move? (yes) --> move, moveTimer to 0.
//        (if yes) --> is it time to damage? (yes) --> damage, damageTimer to 0.

for (Soldaat s : soldaten){
  //check if it is not an empty slot, if there is no collision and if the other soldier is not me
               if (s != null&&collision == false&&id!=s.id){ 
                 collision = s_checkCollision(s);
                  
               }
             }

                 
if (collision == false){
  collision = k_checkCollision(rood,blauw);
}
                 
                 
if (collision == false){
   if (s_moveTimer >1){
       if(this.roodBlauw == 'b'){   x = x+5*(speed/100);}
       if (this.roodBlauw == 'r'){  x = x-5*(speed/100);}
    s_moveTimer = 0;
    s_damageTimer = 0; //else tank is overpowered
     }
     

 }
}
 
              


        //boolean collision = false;
        //if (counter%10-speed==0){
        //    for (Soldaat s : soldaten){
        //        if (s != null){    

        //            //check if any soldaat in array soldaten from the other team is within 10 pixels and do damage if so but wait for timer
        //            if ((abs(this.x-s.rechterpunt)<10)||(abs(s.x-this.rechterpunt)<10)){
        //                collision = true;
        //                // println(checkFriendly(s));
        //                if (!checkFriendly(s)&&counter%2000==0) {s.getDamage(doDamage());}
        //            }
        //        }



        //        //check if the other castle is within 10 pixels and do damage
        //        if (this.roodBlauw == 'r'&&abs(this.x-blauw.rechterpunt)<reach){
        //            collision = true;
        //            blauw.getDamage(doDamage());
        //            if (checkFriendly(blauw)) {blauw.getDamage(doDamage());}
        //        } else if(this.roodBlauw == 'b'&&abs(rood.x-this.rechterpunt)<reach){ //roodblauw check nodig voor collision met friendlies maar zonder damage
        //            collision = true;
        //            rood.getDamage(doDamage());
        //            if (checkFriendly(rood)) {rood.getDamage(doDamage());}
        //        }

        //        if (collision==false){
        //            if(this.roodBlauw == 'b'){        x = x+0.1;}
        //            else if (this.roodBlauw == 'r'){  x = x-0.1;}
        //        }
        //    }
        //}


    void display(){ //moet nog een echte soldaat worden
        float healthbarsize;
        rechterpunt= x+w;
        if (this.roodBlauw == 'r'){
            //println("JAAAA"+this.x);
        }

 //Debug only
          if (roodBlauw == 'r'){
            fill(255,0,0);

        }else if (roodBlauw == 'b'){
            fill(0,0,255);
        }
        //Debug only/
        switch (typeSoldaat){
          
       
            case 1 :
                rect(x,y,w,-100);
                healthbarsize = (50*hp/maxhp);
                break;
            case 2 :
                rect(x,y,w,-100);
                stroke(1);
                line(x,y-w/2,x-reach,y-w/2);
                noStroke();
                healthbarsize = (50*hp/maxhp);
                break;
            case 3 :
                rect(x,y,w,-100);
                healthbarsize = (100*hp/maxhp);
                break;
            default:
                println("ERROR, BAD SOLDIER TYPE");
                fill(0);
                rect(x,y,50,-100);
                healthbarsize = (50*hp/maxhp);
                break;
        }


        if (roodBlauw == 'r'){
            fill(255,0,0);

        }else if (roodBlauw == 'b'){
            fill(0,255,0);
        }
        //hpbar
        stroke(0);
        strokeWeight(2);
        rect(x,y-150,healthbarsize,10);
        //println(hp/maxhp);
    
    }

}