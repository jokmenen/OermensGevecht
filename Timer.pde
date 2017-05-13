void timer(){
  
  Timer timer = new Timer(100000);
  timer.start();
  int passed=1;
  //passed=timer.passed();
 for (Soldaat s : soldaten){
   
                    if(s !=null){
                      //delay(1);
                            
                         s.timerIncrease(passed); //increase both the move and damage timer by the amount of time went by since the start of the function
                           
                        }
                        
                       // if (counter >100){counter = 0;}
                    } 
}


class Timer{

    int startTime; // When is the Timer started
    int endTime; // When does it end

    Timer(int timefill) {
        endTime = timefill;
    }

    // start the timer
    void start() {
        startTime = millis();
    }

    int passed(){ //return how much time has passed since start of timer
      int passedTime = millis()- startTime;
      return passedTime;
    }

    boolean isFinished() { //check if the timer ran out.
        int passedTime = millis()- startTime;
        if (passedTime > endTime) {
            return true;
        } else {
            return false;
        }
    }


}