void keyPressed(){  // If a key is pressed
    if (keysActive == true){
        //if (key == CODED) { // Check if the key is coded
        if (keyCode == 81) { // Q Boer p1
            println("q pressed");
            saB.insertSoldaat('b',1);
        } else if (keyCode == 87) { // W Ridder p1
            println("w pressed");
            saB.insertSoldaat('b',2);
        } else if (keyCode == 69) { // E Paard p1
            println("e pressed");
            saB.insertSoldaat('b',3);
        } else if (keyCode == 73) { // I Boer p2
            println("i pressed");
            saR.insertSoldaat('r',1);
        } else if (keyCode == 79) { // O Ridder p2
            println("o pressed");
            saR.insertSoldaat('r',2);
        } else if (keyCode == 80) { // P Paard p2
            println("p pressed");
            saR.insertSoldaat('r',3);
        }  
        //}
    }
}